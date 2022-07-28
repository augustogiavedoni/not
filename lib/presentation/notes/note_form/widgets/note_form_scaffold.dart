import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../application/notes/note_form/note_form_bloc.dart';
import '../misc/todo_item_presentation_classes.dart';
import 'add_todo_tile.dart';
import 'body_text_field.dart';
import 'options_menu.dart';
import 'todo_list.dart';

class NoteFormScaffold extends StatelessWidget {
  const NoteFormScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () => context.read<NoteFormBloc>().add(
                  const NoteFormEvent.saved(),
                ),
          ),
        ],
        elevation: 0.0,
        backgroundColor: Colors.white10,
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: const Color(0XFF3E70FF),
            ),
      ),
      body: BlocBuilder<NoteFormBloc, NoteFormState>(
        buildWhen: (previous, current) =>
            previous.showErrorMessages != current.showErrorMessages,
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (_) => Todos(),
            child: Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: size.height * 0.75 - Scaffold.of(context).appBarMaxHeight!,
                    child: SingleChildScrollView(
                      child: Column(
                        children: const <Widget>[
                          BodyTextField(),
                          TodoList(),
                          AddTodoTile(),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  const OptionsMenu(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
