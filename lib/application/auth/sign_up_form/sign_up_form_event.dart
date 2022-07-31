part of 'sign_up_form_bloc.dart';

@freezed
class SignUpFormEvent with _$SignUpFormEvent {
  const factory SignUpFormEvent.nameChanged(String name) = NameChanged;
  const factory SignUpFormEvent.emailChanged(String emailAddress) =
      EmailChanged;
  const factory SignUpFormEvent.passwordChanged(String password) =
      PasswordChanged;
  const factory SignUpFormEvent.registerWithEmailAndPasswordPressed() =
      RegisterWithEmailAndPasswordPressed;
}
