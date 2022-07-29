import 'package:flutter/material.dart';

import 'settings_menu_option.dart';

class SettingsOptions extends StatelessWidget {
  const SettingsOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSectionName(
          context: context,
          name: "Account settings",
        ),
        _buildDivider(),
        const SettingsMenuOption(
          name: "Profile",
          icon: Icons.account_circle_outlined,
        ),
        const Divider(
          height: 1,
          color: Color(0XFFC5C6C8),
        ),
        const SizedBox(
          height: 20,
        ),
        _buildSectionName(
          context: context,
          name: "Contact details",
        ),
        _buildDivider(),
        const SettingsMenuOption(
          name: "Email address",
          icon: Icons.alternate_email_rounded,
        ),
        const Divider(
          height: 1,
          color: Color(0XFFC5C6C8),
        ),
        const SizedBox(
          height: 20,
        ),
        _buildSectionName(
          context: context,
          name: "Security settings",
        ),
        _buildDivider(),
        const SettingsMenuOption(
          name: "Password reset",
          icon: Icons.password_rounded,
        ),
        const Divider(
          height: 1,
          color: Color(0XFFC5C6C8),
        ),
      ],
    );
  }

  Divider _buildDivider() {
    return const Divider(
      height: 1,
      color: Color(0XFFC5C6C8),
    );
  }

  Padding _buildSectionName({
    required BuildContext context,
    required String name,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.05,
        vertical: 10,
      ),
      child: Text(
        name,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: const Color(0XFF8C97AB),
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
