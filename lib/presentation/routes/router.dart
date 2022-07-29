import 'package:auto_route/annotations.dart';

import '../notes/note_form/note_form_screen.dart';
import '../notes/notes_overview/notes_overview_screen.dart';
import '../settings/settings_screen.dart';
import '../splash/splash_screen.dart';
import '../onboarding/onboarding_screen.dart';
import '../sign_in/sign_in_screen.dart';

@MaterialAutoRouter(
  preferRelativeImports: true,
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: OnboardingScreen),
    AutoRoute(page: SignInScreen),
    AutoRoute(page: NotesOverviewScreen),
    AutoRoute(page: NoteFormScreen, fullscreenDialog: true),
    AutoRoute(page: SettingsScreen),
  ],
)
class $Router {}
