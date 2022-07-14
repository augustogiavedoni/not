import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../domain/notes/entities/note.dart';
import '../../../../domain/notes/entities/todo_item.dart';
import '../../../routes/router.gr.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: size.height * 0.1,
        maxHeight: size.height * 0.3,
      ),
      child: IntrinsicHeight(
        child: InkWell(
          onTap: () => context.router.push(
            NoteFormScreenRoute(
              note: note,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: note.color.getOrCrash(),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  note.body.getOrCrash(),
                  maxLines: note.todos.isEmpty ? 7 : 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: _getTextColor(
                      noteColor: note.color.getOrCrash(),
                    ),
                  ),
                ),
                ...List.generate(note.todos.length > 3 ? 3 : note.todos.length,
                    (index) {
                  final TodoItem todo = note.todos.getOrCrash().get(index);

                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 15,
                          width: 15,
                          child: Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: todo.completed,
                            onChanged: null,
                            shape: const CircleBorder(),
                            fillColor: MaterialStateColor.resolveWith(
                              (_) => Colors.blue,
                            ),
                            side: BorderSide(
                              width: 1.5,
                              color: Colors.grey[500]!,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          todo.name.getOrCrash(),
                          style: TextStyle(
                            color: _getTextColor(
                              noteColor: note.color.getOrCrash(),
                            ),
                            decoration: todo.completed
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getTextColor({
    required Color noteColor,
  }) {
    final double noteColorLuminance = (0.299 * noteColor.red +
            0.587 * noteColor.green +
            0.114 * noteColor.blue) /
        255;

    if (noteColorLuminance > 0.5) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }
}
