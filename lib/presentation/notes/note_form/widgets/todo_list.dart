import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../application/notes/note_form/note_form_bloc.dart';
import '../misc/todo_item_presentation_classes.dart';
import '../misc/build_context_extension.dart';
import 'todo_tile.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<NoteFormBloc, NoteFormState>(
      listenWhen: (previous, current) =>
          previous.note.todos.isFull != current.note.todos.isFull,
      listener: (context, state) {
        if (state.note.todos.isFull) {
          //TODO: show SnackBar
        }
      },
      child: Consumer<Todos>(
        builder: (context, todos, child) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: todos.value.size,
            itemBuilder: (context, index) => TodoTile(
              key: ValueKey(
                context.todos[index].id,
              ),
              index: index,
            ),
            separatorBuilder: (_, __) => const SizedBox(
              height: 5,
            ),
          );
        },
      ),
    );
  }
}
