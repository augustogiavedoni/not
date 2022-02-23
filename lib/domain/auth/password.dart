import 'package:dartz/dartz.dart';

import '../core/value_object.dart';
import '../core/failures.dart';
import '../core/value_validators.dart';

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Password(String? password) {
    assert(password != null);

    return Password._(
      validatePassword(password!),
    );
  } 

  const Password._(this.value);
}
