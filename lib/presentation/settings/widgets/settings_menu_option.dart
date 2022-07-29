import 'package:flutter/material.dart';

class SettingsMenuOption extends StatelessWidget {
  final String name;
  final IconData icon;

  const SettingsMenuOption({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: const Color(0XFFB5C4f6),
      ),
      title: Text(
        name,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: const Color(0XFFB5C4f6),
              fontWeight: FontWeight.bold,
            ),
      ),
      tileColor: const Color(0XFF222E41),
      minLeadingWidth: 20,
      onTap: () {},
    );
  }
}
