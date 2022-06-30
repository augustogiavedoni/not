import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/auth_failure.dart';
import '../../../domain/auth/value_objects/email_address.dart';
import '../../../domain/auth/i_auth_facade.dart';
import '../../../domain/auth/value_objects/password.dart';

part 'sign_up_form_bloc.freezed.dart';
part 'sign_up_form_event.dart';
part 'sign_up_form_state.dart';

@injectable
class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final IAuthFacade _authFacade;

  SignUpFormBloc(this._authFacade) : super(SignUpFormState.initial()) {
    on<SignUpFormEvent>((event, emit) async {
      if (event is EmailChanged) {
        emit(
          state.copyWith(
            emailAddress: EmailAddress(event.emailAddress),
            authFailureOrSuccessOption: none(),
          ),
        );
      } else if (event is PasswordChanged) {
        emit(
          state.copyWith(
            password: Password(event.password),
            authFailureOrSuccessOption: none(),
          ),
        );
      } else if (event is RegisterWithEmailAndPasswordPressed) {
        await _performActionOnAuthFacadeWithEmailAndPassword(
          emit,
          _authFacade.registerWithEmailAndPassword,
        );
      }
    });
  }

  Future<void> _performActionOnAuthFacadeWithEmailAndPassword(
    Emitter<SignUpFormState> emitter,
    Future<Either<AuthFailure, Unit>> Function({
      required EmailAddress emailAddress,
      required Password password,
    })
        forwardedCall,
  ) async {
    final bool isEmailAddressValid = state.emailAddress.isValid();
    final bool isPasswordValid = state.password.isValid();
    Either<AuthFailure, Unit>? failureOrSuccess;

    if (isEmailAddressValid && isPasswordValid) {
      emitter(
        state.copyWith(
          isSubmitting: true,
          authFailureOrSuccessOption: none(),
        ),
      );

      failureOrSuccess = await forwardedCall(
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
