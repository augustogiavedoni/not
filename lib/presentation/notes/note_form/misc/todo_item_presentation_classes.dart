import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import '../../../../domain/core/value_objects/unique_id.dart';
import '../../../../domain/notes/entities/todo_item.dart';
import '../../../../domain/notes/value_objects/todo_name.dart';

part 'todo_item_presentation_classes.freezed.dart';

class Todos extends ValueNotifier<KtList<TodoItemPrimitive>> {
  Todos() : super(emptyList<TodoItemPrimitive>());
}

@freezed
abstract class TodoItemPrimitive implements _$TodoItemPrimitive {
  const TodoItemPrimitive._();

  const factory TodoItemPrimitive({
    required UniqueId id,
    required String name,
    required bool completed,
  }) = _TodoItemPrimitive;

  factory TodoItemPrimitive.empty() => TodoItemPrimitive(
        id: UniqueId(),
        name: "",
        completed: false,
      );

  factory TodoItemPrimitive.fromDomain(TodoItem todoItem) {
    return TodoItemPrimitive(
      id: todoItem.id,
      name: todoItem.name.getOrCrash(),
      completed: todoItem.completed,
    );
  }

  TodoItem toDomain() {
    return TodoItem(
      id: id,
      name: TodoName(name),
      completed: completed,
    );
  }
}
