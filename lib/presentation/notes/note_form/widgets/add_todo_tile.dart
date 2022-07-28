import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';

import '../misc/build_context_extension.dart';
import '../../../../application/notes/note_form/note_form_bloc.dart';
import '../misc/todo_item_presentation_classes.dart';

class AddTodoTile extends StatelessWidget {
  const AddTodoTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteFormBloc, NoteFormState>(
      listenWhen: (previous, current) =>
          previous.isEditing != current.isEditing,
      listener: (context, state) {
        context.todos = state.note.todos.value.fold(
          (f) => listOf<TodoItemPrimitive>(),
          (todoItemList) =>
              todoItemList.map((_) => TodoItemPrimitive.fromDomain(_)),
        );
      },
      buildWhen: (p, c) => p.note.todos.isFull != c.note.todos.isFull,
      builder: (context, state) {
        return ListTile(
          enabled: !state.note.todos.isFull,
          title: const Text('Add To-Do'),
          leading: const Icon(Icons.add),
          onTap: () {
            context.todos =
                context.todos.plusElement(TodoItemPrimitive.empty());
            context.read<NoteFormBloc>().add(
                  NoteFormEvent.todosChanged(context.todos),
                );
          },
        );
      },
    );
  }
}
