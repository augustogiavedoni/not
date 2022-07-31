import 'package:firebase_auth/firebase_auth.dart';
import 'package:not/domain/core/value_objects/unique_id.dart';

import '../../domain/auth/not_user.dart';
import '../../domain/auth/value_objects/name.dart';

extension FirebaseUserDomainX on User {
  NotUser toDomain() {
    return NotUser(
      name: Name(displayName),
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
