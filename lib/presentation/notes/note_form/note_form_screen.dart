import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/notes/note_form/note_form_bloc.dart';
import '../../../domain/notes/entities/note.dart';
import '../../../domain/notes/note_failure.dart';
import '../../../injection.dart';
import '../../common_widgets/custom_dialog.dart';
import '../../routes/router.gr.dart';
import 'widgets/note_form_scaffold.dart';
import 'widgets/saving_in_progress_overlay.dart';

class NoteFormScreen extends StatelessWidget {
  final Note? note;

  const NoteFormScreen({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NoteFormBloc>()
        ..add(
          NoteFormEvent.initialized(
            optionOf(note),
          ),
        ),
      child: BlocConsumer<NoteFormBloc, NoteFormState>(
        listenWhen: (previous, current) =>
            previous.saveFailureOrSucessOption !=
            current.saveFailureOrSucessOption,
        listener: (context, state) {
          state.saveFailureOrSucessOption.fold(
            () {},
            (either) => either.fold(
              (failure) => _showFailureDialog(context, failure),
              (_) => context.router.popUntil(
                (route) => route.settings.name == NotesOverviewScreenRoute.name,
              ),
            ),
          );
        },
        buildWhen: (previous, current) => previous.isSaving != current.isSaving,
        builder: (context, state) {
          return Stack(
            children: <Widget>[
              const NoteFormScaffold(),
              SavingInProgressOverlay(
                isSaving: state.isSaving,
              ),
            ],
          );
        },
      ),
    );
  }

  Future<dynamic> _showFailureDialog(
    BuildContext context,
    NoteFailure failure,
  ) {
    final String description = failure.map(
      unexpected: (_) => "Unexpected error occured, please contact support.",
      notFound: (_) =>
          "Couldn't update the note. Was it deleted from another device?",
      insufficientPermission: (_) => "Insufficient permissions.",
    );

    return showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: "Something happened",
          description: description,
          mainButtonText: "Go back",
          mainButtonFunctionality: () => Navigator.of(context).pop(),
          dialogStatus: DialogStatus.error,
        );
      },
    );
  }
}
