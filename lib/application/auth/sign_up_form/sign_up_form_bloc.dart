import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/value_objects/email_address.dart';
import '../../../domain/auth/i_auth_facade.dart';
import '../../../domain/auth/value_objects/name.dart';
import '../../../domain/auth/value_objects/password.dart';

part 'sign_up_form_bloc.freezed.dart';
part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final IAuthFacade _authFacade;

  SignUpFormBloc(this._authFacade) : super(SignUpFormState.initial()) {
    on<SignUpFormEvent>((event, emit) async {
      await event.map<FutureOr<void>>(
        emailChanged: (event) => emit(
          state.copyWith(
            emailAddress: EmailAddress(event.emailAddress),
            authFailureOrSuccessOption: none(),
          ),
        ),
        passwordChanged: (event) => emit(
          state.copyWith(
            password: Password(event.password),
            authFailureOrSuccessOption: none(),
          ),
        ),
        nameChanged: (event) => emit(
          state.copyWith(
            name: Name(event.name),
            authFailureOrSuccessOption: none(),
          ),
        ),
        registerWithEmailAndPasswordPressed: (event) async =>
            await _performActionOnAuthFacadeWithEmailAndPassword(
          emit,
          _authFacade.registerWithEmailAndPassword,
        ),
      );
    });
  }

  Future<void> _performActionOnAuthFacadeWithEmailAndPassword(
    Emitter<SignUpFormState> emitter,
    Future<Either<AuthFailure, Unit>> Function({
      required Name name,
      required EmailAddress emailAddress,
      required Password password,
    })
        forwardedCall,
  ) async {
    final bool isNameValid = state.name.isValid();
    final bool isEmailAddressValid = state.emailAddress.isValid();
    final bool isPasswordValid = state.password.isValid();
    Either<AuthFailure, Unit>? failureOrSuccess;

    if (isNameValid && isEmailAddressValid && isPasswordValid) {
      emitter(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await forwardedCall(
        name: state.name,
        emailAddress: state.emailAddress,
        password: state.password,
      );
    }

    emitter(
      state.copyWith(
        isSubmitting: false,
        showErrorMessages: true,
        authFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}
