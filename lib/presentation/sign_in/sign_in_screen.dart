import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/sign_in_form/sign_in_form_bloc.dart';

import '../../injection.dart';

import '../core/theme/app_colors.dart';

import 'widgets/sign_in_form.dart';
import 'widgets/sign_up_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightblue,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(
                height: size.height * 0.15,
              ),
              Container(
                decoration: const BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                height: size.height * 0.85,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.10,
                    ),
                    Text(
                      "Welcome back!",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We missed you...",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                      ),
                      child: BlocProvider(
                        create: (context) => getIt<SignInFormBloc>(),
                        child: const SignInForm(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SignUpForm(),
        ],
      ),
    );
  }
}
