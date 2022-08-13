import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';
import 'widgets/settings_options.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Settings",
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0,
        backgroundColor: darkblue,
      ),
      backgroundColor: darkblue,
      body: const SettingsOptions(),
    );
  }
}
