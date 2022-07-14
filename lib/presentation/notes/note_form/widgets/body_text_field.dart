import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../application/notes/note_form/note_form_bloc.dart';
import '../../../../domain/notes/value_objects/note_body.dart';

class BodyTextField extends HookWidget {
  const BodyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
        useTextEditingController();

    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (previous, current) =>
          previous.isEditing != current.isEditing,
      listener: (context, state) {
        textEditingController.text = state.note.body.getOrCrash();
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextFormField(
          controller: textEditingController,
          decoration: const InputDecoration(
            counterText: "",
            border: InputBorder.none,
          ),
          maxLength: NoteBody.maxLength,
          minLines: 5,
          maxLines: null,
          onChanged: (value) => context.read<NoteFormBloc>().add(
                NoteFormEvent.bodyChanged(value),
              ),
          validator: (_) =>
              context.read<NoteFormBloc>().state.note.body.value.fold(
                    (failure) => failure.maybeMap(
                      empty: (failure) => "Cannot be empty",
                      exceedingLength: (failure) =>
                          "Exceeding length, max: ${failure.maxLength}",
                      orElse: () => null,
                    ),
                    (_) => null,
                  ),
        ),
      ),
    );
  }
}
