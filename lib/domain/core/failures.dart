import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    required String failedValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.emptyEmail() = EmptyEmail<T>;

  const factory ValueFailure.shortPassword({
    required String failedValue,
  }) = ShortPassword<T>;

  const factory ValueFailure.emptyPassword() = EmptyPassword<T>;

  const factory ValueFailure.exceedingLength({
    required String failedValue,
    required int maxLength,
  }) = ExceedingLength<T>;

  const factory ValueFailure.empty() = Empty<T>;

  const factory ValueFailure.multiLine() = MultiLine<T>;

  const factory ValueFailure.listTooLong({
    required int maxLength,
  }) = ListTooLong<T>;
}
