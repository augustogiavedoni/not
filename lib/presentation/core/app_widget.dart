import 'package:flutter/material.dart';
import 'package:not/presentation/sign_in/sign_in_screen.dart';

import 'theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: NotTheme.light(context),
      title: "Not",
      home: const SignInScreen(),
    );
  }
}
