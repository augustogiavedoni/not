import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/auth/email_address.dart';
import '../../../domain/auth/i_auth_facade.dart';
import '../../../domain/auth/password.dart';
import '../../../domain/auth/auth_failure.dart';

part 'sign_in_form_event.dart';
part 'sign_in_form_state.dart';
part 'sign_in_form_bloc.freezed.dart';

@injectable
class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) async {
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
      } else if (event is SignInWithEmailAndPasswordPressed) {
        await _performActionOnAuthFacadeWithEmailAndPassword(
          emit,
          _authFacade.signInWithEmailAndPassword,
        );
      } else if (event is SignInWithGooglePressed) {
        emit(
          state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ),
        );

        final Either<AuthFailure, Unit> failureOrSuccess =
            await _authFacade.signInWithGoogle();

        emit(
          state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: some(failureOrSuccess),
          ),
        );
      }
    });
  }

  Future<void> _performActionOnAuthFacadeWithEmailAndPassword(
    Emitter<SignInFormState> emitter,
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
