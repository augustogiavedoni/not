import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/sign_up_form/sign_up_form_bloc.dart';
import '../../../domain/auth/auth_failure.dart';
import '../../core/theme/app_colors.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isSignUpShowing = false;
  bool _isLoading = false;
  bool _needsValidation = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocConsumer<SignUpFormBloc, SignUpFormState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () => null,
          (either) => either.fold(
            (failure) => _showFailureDialog(context, failure),
            (_) {
              //TODO: implementar navegación
            },
          ),
        );
      },
      builder: (context, state) {
        return Positioned(
          bottom: 0,
          child: AnimatedContainer(
            width: size.width,
            height: _isSignUpShowing ? size.height * 0.85 : size.height * 0.1,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              onTap: () => setState(() {
                _isSignUpShowing = !_isSignUpShowing;
              }),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.0025,
                  ),
                  Icon(
                    _isSignUpShowing
                        ? Icons.keyboard_arrow_down_rounded
                        : Icons.keyboard_arrow_up_rounded,
                    color: black,
                  ),
                  SizedBox(
                    height: size.height * 0.0025,
                  ),
                  Text(
                    "Sign up",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Text(
                    "Let's create an account, it's fast and easy!",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: black,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height * 0.025,
                  ),
                  Form(
                    autovalidateMode: _needsValidation
                        ? AutovalidateMode.onUserInteraction
                        : AutovalidateMode.disabled,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email_rounded,
                              color: black,
                            ),
                            labelText: "Email",
                            labelStyle:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: black,
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
                          style:
                              Theme.of(context).textTheme.bodyText2!.copyWith(
                                    color: black,
                                  ),
                          cursorColor: yellow,
                          autocorrect: false,
                          enableSuggestions: true,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (emailAddress) =>
                              BlocProvider.of<SignUpFormBloc>(context).add(
                            SignUpFormEvent.emailChanged(emailAddress),
                          ),
                          validator: (_) => BlocProvider.of<SignUpFormBloc>(
                                  context)
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.lock_rounded,
                        color: black,
                      ),
                      labelText: "Password",
                      labelStyle:
                          Theme.of(context).textTheme.bodyText2!.copyWith(
                                color: black,
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
                          color: black,
                        ),
                    cursorColor: yellow,
                    autocorrect: false,
                    obscureText: true,
                    onChanged: (password) =>
                        BlocProvider.of<SignUpFormBloc>(context).add(
                      SignUpFormEvent.passwordChanged(password),
                    ),
                    validator: (_) => BlocProvider.of<SignUpFormBloc>(context)
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
                      backgroundColor: black,
                      fixedSize: Size(
                        size.width,
                        size.height * 0.06,
                      ),
                    ),
                    onPressed: () {
                      final bool isEmailValid =
                          BlocProvider.of<SignUpFormBloc>(context)
                              .state
                              .emailAddress
                              .isValid();
                      final bool isPasswordValid =
                          BlocProvider.of<SignUpFormBloc>(context)
                              .state
                              .password
                              .isValid();
                      _needsValidation = true;

                      if (isEmailValid && isPasswordValid) {
                        setState(() {
                          _isLoading = true;
                        });
                      }

                      BlocProvider.of<SignUpFormBloc>(context).add(
                        const SignUpFormEvent
                            .registerWithEmailAndPasswordPressed(),
                      );
                    },
                    child: !_isLoading
                        ? Text(
                            "Sign up",
                            style: Theme.of(context).textTheme.button!.copyWith(
                                  color: yellow,
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
                    height: 10,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      side: const BorderSide(
                        color: yellow,
                        width: 1,
                      ),
                      backgroundColor: Colors.white,
                      fixedSize: Size(
                        size.width,
                        size.height * 0.06,
                      ),
                    ),
                    onPressed: () => setState(() {
                      _isSignUpShowing = false;
                    }),
                    child: Text(
                      "Go back",
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color: black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  // OutlinedButton(
                  //   onPressed: () => BlocProvider.of<SignInFormBloc>(context).add(
                  //     const SignUpFormEvent.registerWithEmailAndPasswordPressed(),
                  //   ),
                  //   child: const Text("REGISTER"),
                  // ),
                ],
              ),
            ),
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
