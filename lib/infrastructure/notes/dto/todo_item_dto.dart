import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/core/value_objects/unique_id.dart';
import '../../../domain/notes/entities/todo_item.dart';
import '../../../domain/notes/value_objects/todo_name.dart';

part 'todo_item_dto.freezed.dart';
part 'todo_item_dto.g.dart';

@freezed
abstract class TodoItemDTO implements _$TodoItemDTO {
  const TodoItemDTO._();

  const factory TodoItemDTO({
    required String id,
    required String name,
    required bool completed,
  }) = _TodoItemDTO;

  factory TodoItemDTO.fromDomain(TodoItem todoItem) {
    return TodoItemDTO(
      id: todoItem.id.getOrCrash(),
      name: todoItem.name.getOrCrash(),
      completed: todoItem.completed,
    );
  }

  TodoItem toDomain() {
    return TodoItem(
      id: UniqueId.fromUniqueString(id),
      name: TodoName(name),
      completed: completed,
    );
  }

  factory TodoItemDTO.fromJson(Map<String, dynamic> json) =>
      _$TodoItemDTOFromJson(json);
}
