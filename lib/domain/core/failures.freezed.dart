// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  InvalidEmail<T> invalidEmail<T>({required String failedValue}) {
    return InvalidEmail<T>(
      failedValue: failedValue,
    );
  }

  EmptyEmail<T> emptyEmail<T>() {
    return EmptyEmail<T>();
  }

  ShortPassword<T> shortPassword<T>({required String failedValue}) {
    return ShortPassword<T>(
      failedValue: failedValue,
    );
  }

  EmptyPassword<T> emptyPassword<T>() {
    return EmptyPassword<T>();
  }

  ExceedingLength<T> exceedingLength<T>(
      {required String failedValue, required int maxLength}) {
    return ExceedingLength<T>(
      failedValue: failedValue,
      maxLength: maxLength,
    );
  }

  Empty<T> empty<T>() {
    return Empty<T>();
  }

  MultiLine<T> multiLine<T>() {
    return MultiLine<T>();
  }

  ListTooLong<T> listTooLong<T>({required int maxLength}) {
    return ListTooLong<T>(
      maxLength: maxLength,
    );
  }
}

/// @nodoc
const $ValueFailure = _$ValueFailureTearOff();

/// @nodoc
mixin _$ValueFailure<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function() emptyEmail,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function() emptyPassword,
    required TResult Function(String failedValue, int maxLength)
        exceedingLength,
    required TResult Function() empty,
    required TResult Function() multiLine,
    required TResult Function(int maxLength) listTooLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmptyEmail<T> value) emptyEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(EmptyPassword<T> value) emptyPassword,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(MultiLine<T> value) multiLine,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;
}

/// @nodoc
abstract class $InvalidEmailCopyWith<T, $Res> {
  factory $InvalidEmailCopyWith(
          InvalidEmail<T> value, $Res Function(InvalidEmail<T>) then) =
      _$InvalidEmailCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$InvalidEmailCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidEmailCopyWith<T, $Res> {
  _$InvalidEmailCopyWithImpl(
      InvalidEmail<T> _value, $Res Function(InvalidEmail<T>) _then)
      : super(_value, (v) => _then(v as InvalidEmail<T>));

  @override
  InvalidEmail<T> get _value => super._value as InvalidEmail<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(InvalidEmail<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidEmail<T> implements InvalidEmail<T> {
  const _$InvalidEmail({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidEmail(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InvalidEmail<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith =>
      _$InvalidEmailCopyWithImpl<T, InvalidEmail<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function() emptyEmail,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function() emptyPassword,
    required TResult Function(String failedValue, int maxLength)
        exceedingLength,
    required TResult Function() empty,
    required TResult Function() multiLine,
    required TResult Function(int maxLength) listTooLong,
  }) {
    return invalidEmail(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
  }) {
    return invalidEmail?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmptyEmail<T> value) emptyEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(EmptyPassword<T> value) emptyPassword,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(MultiLine<T> value) multiLine,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) {
    return invalidEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
  }) {
    return invalidEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) {
    if (invalidEmail != null) {
      return invalidEmail(this);
    }
    return orElse();
  }
}

abstract class InvalidEmail<T> implements ValueFailure<T> {
  const factory InvalidEmail({required String failedValue}) = _$InvalidEmail<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  $InvalidEmailCopyWith<T, InvalidEmail<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmptyEmailCopyWith<T, $Res> {
  factory $EmptyEmailCopyWith(
          EmptyEmail<T> value, $Res Function(EmptyEmail<T>) then) =
      _$EmptyEmailCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$EmptyEmailCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $EmptyEmailCopyWith<T, $Res> {
  _$EmptyEmailCopyWithImpl(
      EmptyEmail<T> _value, $Res Function(EmptyEmail<T>) _then)
      : super(_value, (v) => _then(v as EmptyEmail<T>));

  @override
  EmptyEmail<T> get _value => super._value as EmptyEmail<T>;
}

/// @nodoc

class _$EmptyEmail<T> implements EmptyEmail<T> {
  const _$EmptyEmail();

  @override
  String toString() {
    return 'ValueFailure<$T>.emptyEmail()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmptyEmail<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function() emptyEmail,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function() emptyPassword,
    required TResult Function(String failedValue, int maxLength)
        exceedingLength,
    required TResult Function() empty,
    required TResult Function() multiLine,
    required TResult Function(int maxLength) listTooLong,
  }) {
    return emptyEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
  }) {
    return emptyEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
    required TResult orElse(),
  }) {
    if (emptyEmail != null) {
      return emptyEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmptyEmail<T> value) emptyEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(EmptyPassword<T> value) emptyPassword,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(MultiLine<T> value) multiLine,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) {
    return emptyEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
  }) {
    return emptyEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) {
    if (emptyEmail != null) {
      return emptyEmail(this);
    }
    return orElse();
  }
}

abstract class EmptyEmail<T> implements ValueFailure<T> {
  const factory EmptyEmail() = _$EmptyEmail<T>;
}

/// @nodoc
abstract class $ShortPasswordCopyWith<T, $Res> {
  factory $ShortPasswordCopyWith(
          ShortPassword<T> value, $Res Function(ShortPassword<T>) then) =
      _$ShortPasswordCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$ShortPasswordCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $ShortPasswordCopyWith<T, $Res> {
  _$ShortPasswordCopyWithImpl(
      ShortPassword<T> _value, $Res Function(ShortPassword<T>) _then)
      : super(_value, (v) => _then(v as ShortPassword<T>));

  @override
  ShortPassword<T> get _value => super._value as ShortPassword<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(ShortPassword<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ShortPassword<T> implements ShortPassword<T> {
  const _$ShortPassword({required this.failedValue});

  @override
  final String failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.shortPassword(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShortPassword<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  $ShortPasswordCopyWith<T, ShortPassword<T>> get copyWith =>
      _$ShortPasswordCopyWithImpl<T, ShortPassword<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function() emptyEmail,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function() emptyPassword,
    required TResult Function(String failedValue, int maxLength)
        exceedingLength,
    required TResult Function() empty,
    required TResult Function() multiLine,
    required TResult Function(int maxLength) listTooLong,
  }) {
    return shortPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
  }) {
    return shortPassword?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmptyEmail<T> value) emptyEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(EmptyPassword<T> value) emptyPassword,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(MultiLine<T> value) multiLine,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) {
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
  }) {
    return shortPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class ShortPassword<T> implements ValueFailure<T> {
  const factory ShortPassword({required String failedValue}) =
      _$ShortPassword<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  $ShortPasswordCopyWith<T, ShortPassword<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmptyPasswordCopyWith<T, $Res> {
  factory $EmptyPasswordCopyWith(
          EmptyPassword<T> value, $Res Function(EmptyPassword<T>) then) =
      _$EmptyPasswordCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$EmptyPasswordCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $EmptyPasswordCopyWith<T, $Res> {
  _$EmptyPasswordCopyWithImpl(
      EmptyPassword<T> _value, $Res Function(EmptyPassword<T>) _then)
      : super(_value, (v) => _then(v as EmptyPassword<T>));

  @override
  EmptyPassword<T> get _value => super._value as EmptyPassword<T>;
}

/// @nodoc

class _$EmptyPassword<T> implements EmptyPassword<T> {
  const _$EmptyPassword();

  @override
  String toString() {
    return 'ValueFailure<$T>.emptyPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmptyPassword<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function() emptyEmail,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function() emptyPassword,
    required TResult Function(String failedValue, int maxLength)
        exceedingLength,
    required TResult Function() empty,
    required TResult Function() multiLine,
    required TResult Function(int maxLength) listTooLong,
  }) {
    return emptyPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
  }) {
    return emptyPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
    required TResult orElse(),
  }) {
    if (emptyPassword != null) {
      return emptyPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmptyEmail<T> value) emptyEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(EmptyPassword<T> value) emptyPassword,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(MultiLine<T> value) multiLine,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) {
    return emptyPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
  }) {
    return emptyPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) {
    if (emptyPassword != null) {
      return emptyPassword(this);
    }
    return orElse();
  }
}

abstract class EmptyPassword<T> implements ValueFailure<T> {
  const factory EmptyPassword() = _$EmptyPassword<T>;
}

/// @nodoc
abstract class $ExceedingLengthCopyWith<T, $Res> {
  factory $ExceedingLengthCopyWith(
          ExceedingLength<T> value, $Res Function(ExceedingLength<T>) then) =
      _$ExceedingLengthCopyWithImpl<T, $Res>;
  $Res call({String failedValue, int maxLength});
}

/// @nodoc
class _$ExceedingLengthCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $ExceedingLengthCopyWith<T, $Res> {
  _$ExceedingLengthCopyWithImpl(
      ExceedingLength<T> _value, $Res Function(ExceedingLength<T>) _then)
      : super(_value, (v) => _then(v as ExceedingLength<T>));

  @override
  ExceedingLength<T> get _value => super._value as ExceedingLength<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
    Object? maxLength = freezed,
  }) {
    return _then(ExceedingLength<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
      maxLength: maxLength == freezed
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ExceedingLength<T> implements ExceedingLength<T> {
  const _$ExceedingLength({required this.failedValue, required this.maxLength});

  @override
  final String failedValue;
  @override
  final int maxLength;

  @override
  String toString() {
    return 'ValueFailure<$T>.exceedingLength(failedValue: $failedValue, maxLength: $maxLength)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExceedingLength<T> &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue) &&
            const DeepCollectionEquality().equals(other.maxLength, maxLength));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(failedValue),
      const DeepCollectionEquality().hash(maxLength));

  @JsonKey(ignore: true)
  @override
  $ExceedingLengthCopyWith<T, ExceedingLength<T>> get copyWith =>
      _$ExceedingLengthCopyWithImpl<T, ExceedingLength<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function() emptyEmail,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function() emptyPassword,
    required TResult Function(String failedValue, int maxLength)
        exceedingLength,
    required TResult Function() empty,
    required TResult Function() multiLine,
    required TResult Function(int maxLength) listTooLong,
  }) {
    return exceedingLength(failedValue, maxLength);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
  }) {
    return exceedingLength?.call(failedValue, maxLength);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
    required TResult orElse(),
  }) {
    if (exceedingLength != null) {
      return exceedingLength(failedValue, maxLength);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmptyEmail<T> value) emptyEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(EmptyPassword<T> value) emptyPassword,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(MultiLine<T> value) multiLine,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) {
    return exceedingLength(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
  }) {
    return exceedingLength?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) {
    if (exceedingLength != null) {
      return exceedingLength(this);
    }
    return orElse();
  }
}

abstract class ExceedingLength<T> implements ValueFailure<T> {
  const factory ExceedingLength(
      {required String failedValue,
      required int maxLength}) = _$ExceedingLength<T>;

  String get failedValue;
  int get maxLength;
  @JsonKey(ignore: true)
  $ExceedingLengthCopyWith<T, ExceedingLength<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmptyCopyWith<T, $Res> {
  factory $EmptyCopyWith(Empty<T> value, $Res Function(Empty<T>) then) =
      _$EmptyCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$EmptyCopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $EmptyCopyWith<T, $Res> {
  _$EmptyCopyWithImpl(Empty<T> _value, $Res Function(Empty<T>) _then)
      : super(_value, (v) => _then(v as Empty<T>));

  @override
  Empty<T> get _value => super._value as Empty<T>;
}

/// @nodoc

class _$Empty<T> implements Empty<T> {
  const _$Empty();

  @override
  String toString() {
    return 'ValueFailure<$T>.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Empty<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function() emptyEmail,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function() emptyPassword,
    required TResult Function(String failedValue, int maxLength)
        exceedingLength,
    required TResult Function() empty,
    required TResult Function() multiLine,
    required TResult Function(int maxLength) listTooLong,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmptyEmail<T> value) emptyEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(EmptyPassword<T> value) emptyPassword,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(MultiLine<T> value) multiLine,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty<T> implements ValueFailure<T> {
  const factory Empty() = _$Empty<T>;
}

/// @nodoc
abstract class $MultiLineCopyWith<T, $Res> {
  factory $MultiLineCopyWith(
          MultiLine<T> value, $Res Function(MultiLine<T>) then) =
      _$MultiLineCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$MultiLineCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $MultiLineCopyWith<T, $Res> {
  _$MultiLineCopyWithImpl(
      MultiLine<T> _value, $Res Function(MultiLine<T>) _then)
      : super(_value, (v) => _then(v as MultiLine<T>));

  @override
  MultiLine<T> get _value => super._value as MultiLine<T>;
}

/// @nodoc

class _$MultiLine<T> implements MultiLine<T> {
  const _$MultiLine();

  @override
  String toString() {
    return 'ValueFailure<$T>.multiLine()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MultiLine<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function() emptyEmail,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function() emptyPassword,
    required TResult Function(String failedValue, int maxLength)
        exceedingLength,
    required TResult Function() empty,
    required TResult Function() multiLine,
    required TResult Function(int maxLength) listTooLong,
  }) {
    return multiLine();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
  }) {
    return multiLine?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
    required TResult orElse(),
  }) {
    if (multiLine != null) {
      return multiLine();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmptyEmail<T> value) emptyEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(EmptyPassword<T> value) emptyPassword,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(MultiLine<T> value) multiLine,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) {
    return multiLine(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
  }) {
    return multiLine?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) {
    if (multiLine != null) {
      return multiLine(this);
    }
    return orElse();
  }
}

abstract class MultiLine<T> implements ValueFailure<T> {
  const factory MultiLine() = _$MultiLine<T>;
}

/// @nodoc
abstract class $ListTooLongCopyWith<T, $Res> {
  factory $ListTooLongCopyWith(
          ListTooLong<T> value, $Res Function(ListTooLong<T>) then) =
      _$ListTooLongCopyWithImpl<T, $Res>;
  $Res call({int maxLength});
}

/// @nodoc
class _$ListTooLongCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $ListTooLongCopyWith<T, $Res> {
  _$ListTooLongCopyWithImpl(
      ListTooLong<T> _value, $Res Function(ListTooLong<T>) _then)
      : super(_value, (v) => _then(v as ListTooLong<T>));

  @override
  ListTooLong<T> get _value => super._value as ListTooLong<T>;

  @override
  $Res call({
    Object? maxLength = freezed,
  }) {
    return _then(ListTooLong<T>(
      maxLength: maxLength == freezed
          ? _value.maxLength
          : maxLength // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ListTooLong<T> implements ListTooLong<T> {
  const _$ListTooLong({required this.maxLength});

  @override
  final int maxLength;

  @override
  String toString() {
    return 'ValueFailure<$T>.listTooLong(maxLength: $maxLength)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ListTooLong<T> &&
            const DeepCollectionEquality().equals(other.maxLength, maxLength));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(maxLength));

  @JsonKey(ignore: true)
  @override
  $ListTooLongCopyWith<T, ListTooLong<T>> get copyWith =>
      _$ListTooLongCopyWithImpl<T, ListTooLong<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidEmail,
    required TResult Function() emptyEmail,
    required TResult Function(String failedValue) shortPassword,
    required TResult Function() emptyPassword,
    required TResult Function(String failedValue, int maxLength)
        exceedingLength,
    required TResult Function() empty,
    required TResult Function() multiLine,
    required TResult Function(int maxLength) listTooLong,
  }) {
    return listTooLong(maxLength);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
  }) {
    return listTooLong?.call(maxLength);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidEmail,
    TResult Function()? emptyEmail,
    TResult Function(String failedValue)? shortPassword,
    TResult Function()? emptyPassword,
    TResult Function(String failedValue, int maxLength)? exceedingLength,
    TResult Function()? empty,
    TResult Function()? multiLine,
    TResult Function(int maxLength)? listTooLong,
    required TResult orElse(),
  }) {
    if (listTooLong != null) {
      return listTooLong(maxLength);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidEmail<T> value) invalidEmail,
    required TResult Function(EmptyEmail<T> value) emptyEmail,
    required TResult Function(ShortPassword<T> value) shortPassword,
    required TResult Function(EmptyPassword<T> value) emptyPassword,
    required TResult Function(ExceedingLength<T> value) exceedingLength,
    required TResult Function(Empty<T> value) empty,
    required TResult Function(MultiLine<T> value) multiLine,
    required TResult Function(ListTooLong<T> value) listTooLong,
  }) {
    return listTooLong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
  }) {
    return listTooLong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidEmail<T> value)? invalidEmail,
    TResult Function(EmptyEmail<T> value)? emptyEmail,
    TResult Function(ShortPassword<T> value)? shortPassword,
    TResult Function(EmptyPassword<T> value)? emptyPassword,
    TResult Function(ExceedingLength<T> value)? exceedingLength,
    TResult Function(Empty<T> value)? empty,
    TResult Function(MultiLine<T> value)? multiLine,
    TResult Function(ListTooLong<T> value)? listTooLong,
    required TResult orElse(),
  }) {
    if (listTooLong != null) {
      return listTooLong(this);
    }
    return orElse();
  }
}

abstract class ListTooLong<T> implements ValueFailure<T> {
  const factory ListTooLong({required int maxLength}) = _$ListTooLong<T>;

  int get maxLength;
  @JsonKey(ignore: true)
  $ListTooLongCopyWith<T, ListTooLong<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
