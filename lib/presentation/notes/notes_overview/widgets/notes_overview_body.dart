import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../application/auth/auth_bloc.dart';
import '../../../../application/notes/note_watcher/note_watcher_bloc.dart';
import '../../../../domain/notes/entities/note.dart';
import '../../../../domain/notes/note_failure.dart';
import '../../../common_widgets/custom_dialog.dart';
import 'note_card.dart';
import 'note_with_error_card.dart';

class NotesOverviewBody extends StatelessWidget {
  const NotesOverviewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
          loadSuccess: (state) {
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.05,
                vertical: 10,
              ),
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: List.generate(state.notes.size, (index) {
                  final Note note = state.notes[index];

                  if (note.failureOption.isSome()) {
                    return NoteWithErrorCard(note: note);
                  } else {
                    return NoteCard(note: note);
                  }
                }),
              ),
            );
          },
          loadFailure: (state) {
            Future.delayed(
              const Duration(milliseconds: 30),
              () => _showFailureDialog(
                context,
                state.noteFailure,
              ),
            );

            return const SizedBox();
          },
        );
      },
    );
  }

  Future<void> _showFailureDialog(
    BuildContext context,
    NoteFailure failure,
  ) {
    final String description = failure.maybeMap(
      insufficientPermission: (_) =>
          "You do not have the necessary permissions",
      orElse: () => "Unexpected error. Please, contact support",
    );

    return showDialog(
      context: context,
      builder: (context) {
        return CustomDialog(
          title: "Something happened",
          description: description,
          mainButtonText: "Close",
          mainButtonFunctionality: () =>
              context.read<AuthBloc>().add(const AuthEvent.signedOut()),
          dialogStatus: DialogStatus.error,
        );
      },
    );
  }
}
