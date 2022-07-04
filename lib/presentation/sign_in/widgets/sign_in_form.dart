import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../application/auth/sign_in_form/sign_in_form_bloc.dart';

import '../../../domain/auth/auth_failure.dart';

import '../../core/theme/app_colors.dart';
import '../../routes/router.gr.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool _needsValidation = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocConsumer<SignInFormBloc, SignInFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () => null,
          (either) => either.fold(
            (failure) => _showFailureDialog(context, failure),
            (_) {
              context.router.replace(const NotesOverviewScreenRoute());

              context
                  .read<AuthBloc>()
                  .add(const AuthEvent.authCheckedRequested());
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: _needsValidation
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email_rounded,
                    color: Colors.white,
                  ),
                  labelText: "Email",
                  labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                      ),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: yellow,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: yellow,
                    ),
                  ),
                  focusColor: Colors.white,
                ),
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.white,
                    ),
                cursorColor: yellow,
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
                    color: Colors.white,
                  ),
                  labelText: "Password",
                  labelStyle: Theme.of(context).textTheme.bodyText2!.copyWith(
                        color: Colors.white,
                      ),
                  border: UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: yellow,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: yellow,
                    ),
                  ),
                  focusColor: Colors.white,
                ),
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.white,
                    ),
                cursorColor: yellow,
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
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: yellow,
                  fixedSize: Size(
                    size.width,
                    size.height * 0.06,
                  ),
                ),
                onPressed: () {
                  final bool isEmailValid =
                      BlocProvider.of<SignInFormBloc>(context)
                          .state
                          .emailAddress
                          .isValid();
                  final bool isPasswordValid =
                      BlocProvider.of<SignInFormBloc>(context)
                          .state
                          .password
                          .isValid();
                  _needsValidation = true;

                  if (isEmailValid && isPasswordValid) {
                    setState(() {
                      _isLoading = true;
                    });
                  }

                  BlocProvider.of<SignInFormBloc>(context).add(
                    const SignInFormEvent.signInWithEmailAndPasswordPressed(),
                  );
                },
                child: !_isLoading
                    ? Text(
                        "Sign in",
                        style: Theme.of(context).textTheme.button!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    : const SizedBox(
                        width: 24,
                        height: 24,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: black,
                          ),
                        ),
                      ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Text(
                      "Or continue with",
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.white,
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
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (_) => Colors.white,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset(
                    "lib/presentation/core/assets/images/google.svg",
                    height: size.height * 0.025,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> _showFailureDialog(
    BuildContext context,
    AuthFailure failure,
  ) {
    final Text title = Text("Something happened");
    final Text content = Text(
      failure.map(
        cancelledByUser: (_) => "Operation cancelled by user",
        serverError: (_) => "Woops! Something failed... Try again!",
        emailAlreadyInUse: (_) => "The email is already in use",
        invalidEmailAndPasswordCombination: (_) =>
            "The combination of the email and the password is invalid",
      ),
    );
    final TextButton button = TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text("Go back"),
    );

    setState(() {
      _isLoading = false;
    });

    return showDialog(
      context: context,
      builder: (context) => Platform.isIOS
          ? CupertinoAlertDialog(
              title: title,
              content: content,
              actions: [button],
            )
          : AlertDialog(
              title: title,
              content: content,
              actions: [button],
            ),
    );
  }
}
