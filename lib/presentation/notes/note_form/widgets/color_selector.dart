import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/notes/note_form/note_form_bloc.dart';
import '../../../../domain/notes/value_objects/note_color.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormBloc, NoteFormState>(
      buildWhen: (previous, current) =>
          previous.note.color != current.note.color,
      builder: (context, state) {
        return SizedBox(
          height: 80,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: NoteColor.predefinedColors.length,
            itemBuilder: (context, index) {
              final Color itemColor = NoteColor.predefinedColors[index];

              return GestureDetector(
                onTap: () => context.read<NoteFormBloc>().add(
                      NoteFormEvent.colorChanged(itemColor),
                    ),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0XFF2F3541),
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 1,
                      color: Colors.grey[800]!,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: itemColor,
                      ),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: state.note.color.value.fold(
                          (_) => null,
                          (color) => color == itemColor
                              ? const Center(
                                  child: Icon(
                                    Icons.check_rounded,
                                    size: 20,
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 12,
              );
            },
          ),
        );
      },
    );
  }
}
