import 'package:dartz/dartz.dart';
import 'package:not/domain/auth/not_user.dart';

import 'auth_failure.dart';
import 'value_objects/email_address.dart';
import 'value_objects/password.dart';

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();

  Option<NotUser> getSignedInUser();

  Future<void> signOut();
}
