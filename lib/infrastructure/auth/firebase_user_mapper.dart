import 'package:firebase_auth/firebase_auth.dart';
import 'package:not/domain/core/value_objects/unique_id.dart';

import '../../domain/auth/not_user.dart';

extension FirebaseUserDomainX on User {
  NotUser toDomain() {
    return NotUser(
      id: UniqueId.fromUniqueString(uid),
    );
  }
}
