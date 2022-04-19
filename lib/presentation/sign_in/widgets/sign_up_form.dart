import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _isSignUpShowing = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      child: AnimatedContainer(
        width: size.width,
        height: _isSignUpShowing ? size.height * 0.85 : size.height * 0.1,
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
              const Spacer(),
              Icon(
                _isSignUpShowing
                    ? Icons.keyboard_arrow_down_rounded
                    : Icons.keyboard_arrow_up_rounded,
                color: black,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Sign up",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
