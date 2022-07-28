// ignore_for_file: invalid_annotation_target

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import 'package:not/domain/notes/entities/note.dart';

import '../../../domain/core/value_objects/unique_id.dart';
import '../../../domain/notes/value_objects/list_3.dart';
import '../../../domain/notes/value_objects/note_body.dart';
import '../../../domain/notes/value_objects/note_color.dart';
import 'todo_item_dto.dart';

part 'note_dto.freezed.dart';
part 'note_dto.g.dart';

@freezed
abstract class NoteDTO implements _$NoteDTO {
  const NoteDTO._();

  @JsonSerializable(explicitToJson: true)
  const factory NoteDTO({
    @JsonKey(ignore: true) String? id,
    required String body,
    required int color,
    required List<TodoItemDTO> todos,
    @ServerTimestampConverter() required FieldValue serverTimeStamp,
  }) = _NoteDTO;

  factory NoteDTO.fromDomain(Note note) {
    return NoteDTO(
      id: note.id.getOrCrash(),
      body: note.body.getOrCrash(),
      color: note.color.getOrCrash().value,
      todos: note.todos
          .getOrCrash()
          .map(
            (todoItem) => TodoItemDTO.fromDomain(todoItem),
          )
          .asList(),
      serverTimeStamp: FieldValue.serverTimestamp(),
    );
  }

  Note toDomain() {
    return Note(
      id: UniqueId.fromUniqueString(id ?? ""),
      body: NoteBody(body),
      color: NoteColor(Color(color)),
      todos: List3(
        todos
            .map(
              (dto) => dto.toDomain(),
            )
            .toImmutableList(),
      ),
    );
  }

  factory NoteDTO.fromJson(Map<String, dynamic> json) =>
      _$NoteDTOFromJson(json);

  factory NoteDTO.fromFirestore(DocumentSnapshot documentSnapshot) {
    return NoteDTO.fromJson(documentSnapshot.data() as Map<String, dynamic>)
        .copyWith(id: documentSnapshot.id);
  }
}

class ServerTimestampConverter implements JsonConverter<FieldValue, Object> {
  const ServerTimestampConverter();

  @override
  FieldValue fromJson(Object json) {
    return FieldValue.serverTimestamp();
  }

  @override
  Object toJson(FieldValue fieldValue) => fieldValue;
}
