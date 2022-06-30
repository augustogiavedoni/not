import 'package:dartz/dartz.dart';

import '../../core/value_object.dart';
import '../../core/failures.dart';
import '../../core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String? emailAddress) {
    assert(emailAddress != null);

    return EmailAddress._(
      validateEmailAddress(emailAddress!),
    );
  }

  const EmailAddress._(this.value);
}
