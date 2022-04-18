import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/sign_in_form/sign_in_form_bloc.dart';

import '../../presentation/sign_in/widgets/sign_in_form.dart';

import '../../injection.dart';

import '../core/theme/app_colors.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: lightblue,
      body: Column(
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
                const Spacer(),
                Container(
                  width: size.width,
                  height: size.height * 0.1,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      const Spacer(),
                      const Icon(
                        Icons.keyboard_arrow_up_rounded,
                        color: black,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Sign up",
                        style:
                            Theme.of(context).textTheme.headline6!.copyWith(
                                  color: black,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
