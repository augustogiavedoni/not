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
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
        ),
        children: <Widget>[
          SizedBox(
            height: size.height * 0.15,
          ),
          Text(
            "Welcome back!",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: wine,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 10,
          ),
          // Text(
          //   "Not is a place to keep all your notes safe and available to help you througout your day",
          //   style: Theme.of(context).textTheme.bodyText2!.copyWith(
          //         color: grey,
          //       ),
          //   textAlign: TextAlign.center,
          // ),
          Text(
            "We missed you...",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: grey,
                ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: size.height * 0.10,
          ),
          BlocProvider(
            create: (context) => getIt<SignInFormBloc>(),
            child: const SignInForm(),
          ),
        ],
      ),
    );
  }
}
