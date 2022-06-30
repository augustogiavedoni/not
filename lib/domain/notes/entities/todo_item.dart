import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/failures.dart';
import '../../core/value_objects/unique_id.dart';
import '../value_objects/todo_name.dart';

part 'todo_item.freezed.dart';

@freezed
abstract class TodoItem implements _$TodoItem {
  const TodoItem._();

  const factory TodoItem({
    required UniqueId id,
    required TodoName name,
    required bool completed,
  }) = _TodoItem;

  factory TodoItem.empty() => TodoItem(
        id: UniqueId(),
        name: TodoName(""),
        completed: false,
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.value.fold(
      (failure) => some(failure),
      (_) => none(),
    );
  }
}
