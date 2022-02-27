import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/auth/auth_bloc.dart';

import '../../injection.dart';

import '../routes/router.gr.dart' as app_router;

import 'theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RootStackRouter _appRouter = app_router.Router();

    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider(
          create: (context) => getIt<AuthBloc>()
            ..add(
              const AuthEvent.authCheckedRequested(),
            ),
        ),
      ],
      child: MaterialApp.router(
        routerDelegate: AutoRouterDelegate(_appRouter),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: NotTheme.light(context),
        title: "Not",
      ),
    );
  }
}
