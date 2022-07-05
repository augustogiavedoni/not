import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../application/notes/note_watcher/note_watcher_bloc.dart';
import '../../../../domain/notes/entities/note.dart';
import 'note_card.dart';

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
                    return Container(
                      color: Colors.red,
                      width: 100,
                      height: 100,
                    );
                  } else {
                    return NoteCard(
                      note: note,
                    );
                  }
                }),
              ),
            );
          },
          loadFailure: (state) => Container(
            color: Colors.yellow,
            width: 100,
            height: 100,
          ),
        );
      },
    );
  }
}
