import 'package:dartz/dartz.dart';

import 'failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String emailAddress) {
  const String regEx =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

  if (RegExp(regEx).hasMatch(emailAddress)) {
    return right(emailAddress);
  } else {
    if (emailAddress.isEmpty) {
      return left(
        const ValueFailure.emptyEmail(),
      );
    } else {
      return left(
        ValueFailure.invalidEmail(failedValue: emailAddress),
      );
    }
  }
}

Either<ValueFailure<String>, String> validatePassword(String password) {
  if (password.length >= 6) {
    return right(password);
  } else {
    if (password.isEmpty) {
      return left(
        const ValueFailure.emptyPassword(),
      );
    } else {
      return left(
        ValueFailure.shortPassword(failedValue: password),
      );
    }
  }
}
