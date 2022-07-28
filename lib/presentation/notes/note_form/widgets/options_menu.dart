import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../application/notes/note_actor/note_actor_bloc.dart';
import '../../../../application/notes/note_form/note_form_bloc.dart';
import '../../../../injection.dart';
import 'color_selector.dart';

class OptionsMenu extends StatelessWidget {
  const OptionsMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocProvider<NoteActorBloc>(
      create: (context) => getIt<NoteActorBloc>(),
      child: BlocBuilder<NoteFormBloc, NoteFormState>(
        buildWhen: (previous, current) => previous.note != current.note,
        builder: (context, state) {
          return Container(
            width: size.width,
            height: size.height * 0.25,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Color(0XFF171C26),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const ColorSelector(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            if (state.note.body.isValid()) {
                              context.read<NoteActorBloc>().add(
                                    NoteActorEvent.deleted(state.note),
                                  );
                            }
                            context.router.pop();
                          },
                          child: Row(
                            children: <Widget>[
                              const Icon(
                                Icons.delete_outline_rounded,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Delete note",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
