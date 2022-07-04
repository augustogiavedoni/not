import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/auth/auth_bloc.dart';
import '../../../application/notes/note_actor/note_actor_bloc.dart';
import '../../../application/notes/note_watcher/note_watcher_bloc.dart';
import '../../../domain/notes/note_failure.dart';
import '../../../injection.dart';
import '../../routes/router.gr.dart';

class NotesOverviewScreen extends StatelessWidget {
  const NotesOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<NoteWatcherBloc>(
          create: (context) => getIt<NoteWatcherBloc>()
            ..add(
              const NoteWatcherEvent.watchAllStarted(),
            ),
        ),
        BlocProvider<NoteActorBloc>(
          create: (context) => getIt<NoteActorBloc>(),
        ),
      ],
      child: MultiBlocListener(
        listeners: <BlocListener>[
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) => state.maybeMap(
              unauthenticated: (value) => context.router.replace(
                const SignInScreenRoute(),
              ),
              orElse: () {},
            ),
          ),
          BlocListener<NoteActorBloc, NoteActorState>(
            listener: (context, state) => state.maybeMap(
              deleteFailure: (failure) => _showFailureDialog(
                context,
                failure.noteFailure,
              ),
              orElse: () {},
            ),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Notes"),
            leading: IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () =>
                  context.read<AuthBloc>().add(const AuthEvent.signedOut()),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.indeterminate_check_box),
                onPressed: () {},
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showFailureDialog(
    BuildContext context,
    NoteFailure failure,
  ) {
    final Text title = Text("Something happened");
    final Text content = Text(
      failure.map(
        unexpected: (_) =>
            "Unexpected error occured while deleting, please contact support.",
        notFound: (_) => "",
        insufficientPermission: (_) => "Insufficient permissions.",
      ),
    );
    final TextButton button = TextButton(
      onPressed: () => Navigator.of(context).pop(),
      child: Text("Go back"),
    );

    return showDialog(
      context: context,
      builder: (context) => Platform.isIOS
          ? CupertinoAlertDialog(
              title: title,
              content: content,
              actions: [button],
            )
          : AlertDialog(
              title: title,
              content: content,
              actions: [button],
            ),
    );
  }
}
