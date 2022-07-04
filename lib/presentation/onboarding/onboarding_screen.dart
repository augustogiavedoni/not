import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/theme/app_colors.dart';
import '../routes/router.gr.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size.width * 0.1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: Text(
                    "Not !",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: Text(
                    "Write down what's on your mind and save it to read at a later time.",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: -size.height * 0.075,
              right: -size.width * 0.75,
              child: SizedBox(
                child: SvgPicture.asset(
                  "lib/presentation/core/assets/images/note_taking.svg",
                  fit: BoxFit.cover,
                  width: size.width * 1.8,
                ),
              ),
            ),
            Positioned(
              bottom: size.height * 0.1,
              right: size.width * 0.05,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => black),
                  elevation: MaterialStateProperty.all(0.5),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                onPressed: () {
                  SharedPreferences.getInstance().then((preferences) {
                    preferences.setBool("is_onboarding_completed", true);
                  });

                  context.router.replace(const SignInScreenRoute());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.025,
                    vertical: size.height * 0.01,
                  ),
                  child: Text(
                    "Let's start",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
