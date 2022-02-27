// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'not_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotUserTearOff {
  const _$NotUserTearOff();

  _NotUser call({required UniqueId id}) {
    return _NotUser(
      id: id,
    );
  }
}

/// @nodoc
const $NotUser = _$NotUserTearOff();

/// @nodoc
mixin _$NotUser {
  UniqueId get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotUserCopyWith<NotUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotUserCopyWith<$Res> {
  factory $NotUserCopyWith(NotUser value, $Res Function(NotUser) then) =
      _$NotUserCopyWithImpl<$Res>;
  $Res call({UniqueId id});
}

/// @nodoc
class _$NotUserCopyWithImpl<$Res> implements $NotUserCopyWith<$Res> {
  _$NotUserCopyWithImpl(this._value, this._then);

  final NotUser _value;
  // ignore: unused_field
  final $Res Function(NotUser) _then;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }
}

/// @nodoc
abstract class _$NotUserCopyWith<$Res> implements $NotUserCopyWith<$Res> {
  factory _$NotUserCopyWith(_NotUser value, $Res Function(_NotUser) then) =
      __$NotUserCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id});
}

/// @nodoc
class __$NotUserCopyWithImpl<$Res> extends _$NotUserCopyWithImpl<$Res>
    implements _$NotUserCopyWith<$Res> {
  __$NotUserCopyWithImpl(_NotUser _value, $Res Function(_NotUser) _then)
      : super(_value, (v) => _then(v as _NotUser));

  @override
  _NotUser get _value => super._value as _NotUser;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_NotUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
    ));
  }
}

/// @nodoc

class _$_NotUser implements _NotUser {
  const _$_NotUser({required this.id});

  @override
  final UniqueId id;

  @override
  String toString() {
    return 'NotUser(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotUser &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$NotUserCopyWith<_NotUser> get copyWith =>
      __$NotUserCopyWithImpl<_NotUser>(this, _$identity);
}

abstract class _NotUser implements NotUser {
  const factory _NotUser({required UniqueId id}) = _$_NotUser;

  @override
  UniqueId get id;
  @override
  @JsonKey(ignore: true)
  _$NotUserCopyWith<_NotUser> get copyWith =>
      throw _privateConstructorUsedError;
}
