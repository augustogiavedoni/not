import 'package:flutter/material.dart';

import '../../../../domain/auth/i_auth_facade.dart';
import '../../../../domain/core/errors.dart';
import '../../../../injection.dart';

class NotUserAvatar extends StatefulWidget {
  const NotUserAvatar({Key? key}) : super(key: key);

  @override
  State<NotUserAvatar> createState() => _NotUserAvatarState();
}

class _NotUserAvatarState extends State<NotUserAvatar> {
  late String initials;

  @override
  void initState() {
    super.initState();

    final userOption = getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    final nameAndLastname = user.name.getOrCrash().split(" ");
    initials = nameAndLastname.first[0];

    if (nameAndLastname.length > 1) {
      initials += " ${nameAndLastname[1][0]}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0XFF39485C),
      child: Text(
        initials,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: const Color(0XFFB3C4ff),
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
