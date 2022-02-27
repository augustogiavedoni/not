import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart';

import '../../core/theme/app_colors.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () => null,
          (either) => either.fold(
            (failure) {
              //TODO: refactorizar para mostrar mejor el mensaje de error.
              showDialog(
                context: context,
                builder: (context) => Text(
                  failure.map(
                    cancelledByUser: (_) => "Operation cancelled by user",
                    serverError: (_) => "Woops! Something failed... Try again!",
                    emailAlreadyInUse: (_) => "The email is already in use",
                    invalidEmailAndPasswordCombination: (_) =>
                        "The combination of the email and the password is invalid",
                  ),
                ),
              );
            },
            (_) {
              //TODO: implementar navegación
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: <Widget>[
              Text(
                "Welcome to Not!",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: wine,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Not is a place to keep all your notes safe and available to help you througout your day",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: grey,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.email_rounded,
                  ),
                  labelText: "Email",
                ),
                autocorrect: false,
                enableSuggestions: true,
                keyboardType: TextInputType.emailAddress,
                onChanged: (emailAddress) =>
                    BlocProvider.of<SignInFormBloc>(context).add(
                  SignInFormEvent.emailChanged(emailAddress),
                ),
                validator: (_) => BlocProvider.of<SignInFormBloc>(context)
                    .state
                    .emailAddress
                    .value
                    .fold(
                      (failure) => failure.maybeMap(
                        invalidEmail: (_) => "The email is invalid",
                        emptyEmail: (_) => "The email can't be empty",
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_rounded,
                  ),
                  labelText: "Password",
                ),
                autocorrect: false,
                obscureText: true,
                onChanged: (password) =>
                    BlocProvider.of<SignInFormBloc>(context).add(
                  SignInFormEvent.passwordChanged(password),
                ),
                validator: (_) => BlocProvider.of<SignInFormBloc>(context)
                    .state
                    .password
                    .value
                    .fold(
                      (failure) => failure.maybeMap(
                        emptyPassword: (_) => "The password can't be empty",
                        shortPassword: (_) => "The password is too short",
                        orElse: () => null,
                      ),
                      (_) => null,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () => BlocProvider.of<SignInFormBloc>(context).add(
                  const SignInFormEvent.signInWithEmailAndPasswordPressed(),
                ),
                child: const Text("SIGN IN"),
              ),
              OutlinedButton(
                onPressed: () => BlocProvider.of<SignInFormBloc>(context).add(
                  const SignInFormEvent.signInWithGooglePressed(),
                ),
                child: const Text("SIGN IN WITH GOOGLE"),
              ),
              OutlinedButton(
                onPressed: () => BlocProvider.of<SignInFormBloc>(context).add(
                  const SignInFormEvent.registerWithEmailAndPasswordPressed(),
                ),
                child: const Text("REGISTER"),
              ),
            ],
          ),
        );
      },
    );
  }
}
