import 'package:flutter/material.dart';

import '../../../../domain/notes/entities/note.dart';

class NoteWithErrorCard extends StatelessWidget {
  final Note note;

  const NoteWithErrorCard({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              "Invalid note",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Please, contact support and mention the following error code:",
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Colors.white,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            note.failureOption.fold(
              () => "",
              (failure) => failure.toString(),
            ),
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
