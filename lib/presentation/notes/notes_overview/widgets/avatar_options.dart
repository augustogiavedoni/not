import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../application/auth/auth_bloc.dart';
import '../../../../application/notes/note_watcher/note_watcher_bloc.dart';
import '../../../core/theme/app_colors.dart';
import '../../../routes/router.gr.dart';
import 'avatar.dart';

class AvatarOptions extends HookWidget {
  const AvatarOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ValueNotifier<bool> toggleState = useState(false);

    return Padding(
      padding: EdgeInsets.only(
        right: size.width * 0.05,
      ),
      child: PopupMenuButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        offset: const Offset(
          0,
          50,
        ),
        itemBuilder: (context) => <PopupMenuEntry>[
          PopupMenuItem(
            child: _buildMenuOptionRow(
              icon: toggleState.value
                  ? Icons.notes_rounded
                  : Icons.remove_done_rounded,
              text: toggleState.value
                  ? "Show all notes"
                  : 'Show uncompleted notes',
            ),
            onTap: () {
              toggleState.value = !toggleState.value;

              BlocProvider.of<NoteWatcherBloc>(context).add(
                toggleState.value
                    ? const NoteWatcherEvent.watchUncompletedStarted()
                    : const NoteWatcherEvent.watchAllStarted(),
              );
            },
          ),
          PopupMenuItem(
            child: _buildMenuOptionRow(
              icon: Icons.settings_rounded,
              text: "Settings",
            ),
            onTap: () => context.router.push(
              const SettingsScreenRoute(),
            ),
          ),
          PopupMenuItem(
            child: _buildMenuOptionRow(
              icon: Icons.exit_to_app_rounded,
              text: "Sign out",
            ),
            onTap: () => context.read<AuthBloc>().add(
                  const AuthEvent.signedOut(),
                ),
          ),
        ],
        child: const NotUserAvatar(),
      ),
    );
  }

  Row _buildMenuOptionRow({
    required IconData icon,
    required String text,
  }) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: darkblue,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(text),
      ],
    );
  }
}
