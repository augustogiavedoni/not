// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TodoItemDTO _$$_TodoItemDTOFromJson(Map<String, dynamic> json) =>
    _$_TodoItemDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$$_TodoItemDTOToJson(_$_TodoItemDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'completed': instance.completed,
    };
