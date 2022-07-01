// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'todo_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TodoItemDTO _$TodoItemDTOFromJson(Map<String, dynamic> json) {
  return _TodoItemDTO.fromJson(json);
}

/// @nodoc
mixin _$TodoItemDTO {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get completed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TodoItemDTOCopyWith<TodoItemDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoItemDTOCopyWith<$Res> {
  factory $TodoItemDTOCopyWith(
          TodoItemDTO value, $Res Function(TodoItemDTO) then) =
      _$TodoItemDTOCopyWithImpl<$Res>;
  $Res call({String id, String name, bool completed});
}

/// @nodoc
class _$TodoItemDTOCopyWithImpl<$Res> implements $TodoItemDTOCopyWith<$Res> {
  _$TodoItemDTOCopyWithImpl(this._value, this._then);

  final TodoItemDTO _value;
  // ignore: unused_field
  final $Res Function(TodoItemDTO) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$_TodoItemDTOCopyWith<$Res>
    implements $TodoItemDTOCopyWith<$Res> {
  factory _$$_TodoItemDTOCopyWith(
          _$_TodoItemDTO value, $Res Function(_$_TodoItemDTO) then) =
      __$$_TodoItemDTOCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, bool completed});
}

/// @nodoc
class __$$_TodoItemDTOCopyWithImpl<$Res> extends _$TodoItemDTOCopyWithImpl<$Res>
    implements _$$_TodoItemDTOCopyWith<$Res> {
  __$$_TodoItemDTOCopyWithImpl(
      _$_TodoItemDTO _value, $Res Function(_$_TodoItemDTO) _then)
      : super(_value, (v) => _then(v as _$_TodoItemDTO));

  @override
  _$_TodoItemDTO get _value => super._value as _$_TodoItemDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? completed = freezed,
  }) {
    return _then(_$_TodoItemDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TodoItemDTO extends _TodoItemDTO {
  const _$_TodoItemDTO(
      {required this.id, required this.name, required this.completed})
      : super._();

  factory _$_TodoItemDTO.fromJson(Map<String, dynamic> json) =>
      _$$_TodoItemDTOFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final bool completed;

  @override
  String toString() {
    return 'TodoItemDTO(id: $id, name: $name, completed: $completed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TodoItemDTO &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.completed, completed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(completed));

  @JsonKey(ignore: true)
  @override
  _$$_TodoItemDTOCopyWith<_$_TodoItemDTO> get copyWith =>
      __$$_TodoItemDTOCopyWithImpl<_$_TodoItemDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TodoItemDTOToJson(this);
  }
}

abstract class _TodoItemDTO extends TodoItemDTO {
  const factory _TodoItemDTO(
      {required final String id,
      required final String name,
      required final bool completed}) = _$_TodoItemDTO;
  const _TodoItemDTO._() : super._();

  factory _TodoItemDTO.fromJson(Map<String, dynamic> json) =
      _$_TodoItemDTO.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  bool get completed => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_TodoItemDTOCopyWith<_$_TodoItemDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
