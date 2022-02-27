import 'package:auto_route/annotations.dart';

import '../../presentation/splash/splash_screen.dart';
import '../../presentation/sign_in/sign_in_screen.dart';

@MaterialAutoRouter(
  preferRelativeImports: true,
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: SignInScreen),
  ],
)
class $Router {}
