import 'package:dartz/dartz.dart';

import '../../core/value_object.dart';
import '../../core/failures.dart';
import '../../core/value_validators.dart';

class Name extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Name(String? name) {
    assert(name != null);

    return Name._(
      validateName(name!),
    );
  }

  const Name._(this.value);
}
