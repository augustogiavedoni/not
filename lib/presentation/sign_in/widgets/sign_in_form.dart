import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart';

import '../../core/theme/app_colors.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email_rounded,
                  ),
                  labelText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: Theme.of(context).textTheme.bodyText2,
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
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.lock_rounded,
                  ),
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                style: Theme.of(context).textTheme.bodyText2,
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
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: wine,
                  fixedSize: Size(
                    size.width,
                    size.height * 0.06,
                  ),
                ),
                onPressed: () => BlocProvider.of<SignInFormBloc>(context).add(
                  const SignInFormEvent.signInWithEmailAndPasswordPressed(),
                ),
                child: Text(
                  "SIGN IN",
                  style: Theme.of(context).textTheme.button,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: const <Widget>[
                  Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      "Or continue with",
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () => BlocProvider.of<SignInFormBloc>(context).add(
                  const SignInFormEvent.signInWithGooglePressed(),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset(
                    "assets/images/google.svg",
                    height: size.height * 0.025,
                  ),
                ),
              ),
              // OutlinedButton(
              //   onPressed: () => BlocProvider.of<SignInFormBloc>(context).add(
              //     const SignInFormEvent.registerWithEmailAndPasswordPressed(),
              //   ),
              //   child: const Text("REGISTER"),
              // ),
            ],
          ),
        );
      },
    );
  }
}
