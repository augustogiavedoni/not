import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implicitly_animated_reorderable_list_2/implicitly_animated_reorderable_list_2.dart';
import 'package:kt_dart/kt.dart';
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
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Want longer lists? Activate premium!"),
              action: SnackBarAction(
                label: "Buy now",
                textColor: const Color(0XFF3E70FF),
                onPressed: () {},
              ),
            ),
          );
        }
      },
      child: Consumer<Todos>(
        builder: (context, todos, child) =>
            ImplicitlyAnimatedReorderableList<TodoItemPrimitive>(
          shrinkWrap: true,
          removeDuration: const Duration(milliseconds: 0),
          items: todos.value.asList(),
          itemBuilder: (context, itemAnimation, item, index) => Reorderable(
            key: ValueKey(item.id),
            builder: (context, animation, inDrag) => ScaleTransition(
              scale: Tween<double>(
                begin: 1,
                end: 1.05,
              ).animate(animation),
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: TodoTile(
                  index: index,
                  elevation: animation.value * 4,
                ),
              ),
            ),
          ),
          areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
          onReorderFinished: (item, from, to, newItems) {
            context.todos = newItems.toImmutableList();

            context.read<NoteFormBloc>().add(
                  NoteFormEvent.todosChanged(context.todos),
                );
          },
        ),
      ),
    );
  }
}
