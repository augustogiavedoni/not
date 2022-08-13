import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyNotesMessage extends StatelessWidget {
  const EmptyNotesMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            "lib/presentation/core/assets/images/note.svg",
            height: size.height * .15,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "No notes found",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Create a new note with the + button",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
