import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

import '../../../domain/notes/entities/note.dart';
import '../../../domain/notes/i_note_repository.dart';
import '../../../domain/notes/note_failure.dart';
import '../../../domain/notes/value_objects/list_3.dart';
import '../../../domain/notes/value_objects/note_body.dart';
import '../../../domain/notes/value_objects/note_color.dart';
import '../../../presentation/notes/note_form/misc/todo_item_presentation_classes.dart';

part 'note_form_event.dart';
part 'note_form_state.dart';
part 'note_form_bloc.freezed.dart';

@injectable
class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  final INoteRepository _noteRepository;

  NoteFormBloc(this._noteRepository) : super(NoteFormState.initial()) {
    on<NoteFormEvent>((event, emit) {
      event.map(
        initialized: (event) => emit(
          event.initialNoteOption.fold(
            () => state,
            (initialNote) => state.copyWith(
              note: initialNote,
              isEditing: true,
            ),
          ),
        ),
        bodyChanged: (event) => emit(
          state.copyWith(
            note: state.note.copyWith(
              body: NoteBody(event.body),
            ),
            saveFailureOrSucessOption: none(),
          ),
        ),
        colorChanged: (event) => emit(
          state.copyWith(
            note: state.note.copyWith(
              color: NoteColor(event.color),
            ),
            saveFailureOrSucessOption: none(),
          ),
        ),
        todosChanged: (event) => emit(
          state.copyWith(
            note: state.note.copyWith(
              todos: List3(
                event.todos.map(
                  (todoPrimitive) => todoPrimitive.toDomain(),
                ),
              ),
            ),
            saveFailureOrSucessOption: none(),
          ),
        ),
        saved: (event) async {
          Either<NoteFailure, Unit>? failureOrSuccess;

          emit(
            state.copyWith(
              isSaving: true,
              saveFailureOrSucessOption: none(),
            ),
          );

          if (state.note.failureOption.isNone()) {
            failureOrSuccess = state.isEditing
                ? await _noteRepository.update(state.note)
                : await _noteRepository.create(state.note);
          }

          emit(
            state.copyWith(
              isSaving: false,
              showErrorMessages: true,
              saveFailureOrSucessOption: optionOf(failureOrSuccess),
            ),
          );
        },
      );
    });
  }
}
