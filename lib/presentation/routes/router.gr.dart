// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../domain/notes/entities/note.dart' as _i8;
import '../notes/note_form/note_form_screen.dart' as _i5;
import '../notes/notes_overview/notes_overview_screen.dart' as _i4;
import '../onboarding/onboarding_screen.dart' as _i2;
import '../sign_in/sign_in_screen.dart' as _i3;
import '../splash/splash_screen.dart' as _i1;

class Router extends _i6.RootStackRouter {
  Router([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    OnboardingScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OnboardingScreen());
    },
    SignInScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignInScreen());
    },
    NotesOverviewScreenRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.NotesOverviewScreen());
    },
    NoteFormScreenRoute.name: (routeData) {
      final args = routeData.argsAs<NoteFormScreenRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.NoteFormScreen(key: args.key, note: args.note),
          fullscreenDialog: true);
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i6.RouteConfig(OnboardingScreenRoute.name, path: '/onboarding-screen'),
        _i6.RouteConfig(SignInScreenRoute.name, path: '/sign-in-screen'),
        _i6.RouteConfig(NotesOverviewScreenRoute.name,
            path: '/notes-overview-screen'),
        _i6.RouteConfig(NoteFormScreenRoute.name, path: '/note-form-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingScreenRoute extends _i6.PageRouteInfo<void> {
  const OnboardingScreenRoute()
      : super(OnboardingScreenRoute.name, path: '/onboarding-screen');

  static const String name = 'OnboardingScreenRoute';
}

/// generated route for
/// [_i3.SignInScreen]
class SignInScreenRoute extends _i6.PageRouteInfo<void> {
  const SignInScreenRoute()
      : super(SignInScreenRoute.name, path: '/sign-in-screen');

  static const String name = 'SignInScreenRoute';
}

/// generated route for
/// [_i4.NotesOverviewScreen]
class NotesOverviewScreenRoute extends _i6.PageRouteInfo<void> {
  const NotesOverviewScreenRoute()
      : super(NotesOverviewScreenRoute.name, path: '/notes-overview-screen');

  static const String name = 'NotesOverviewScreenRoute';
}

/// generated route for
/// [_i5.NoteFormScreen]
class NoteFormScreenRoute extends _i6.PageRouteInfo<NoteFormScreenRouteArgs> {
  NoteFormScreenRoute({_i7.Key? key, required _i8.Note? note})
      : super(NoteFormScreenRoute.name,
            path: '/note-form-screen',
            args: NoteFormScreenRouteArgs(key: key, note: note));

  static const String name = 'NoteFormScreenRoute';
}

class NoteFormScreenRouteArgs {
  const NoteFormScreenRouteArgs({this.key, required this.note});

  final _i7.Key? key;

  final _i8.Note? note;

  @override
  String toString() {
    return 'NoteFormScreenRouteArgs{key: $key, note: $note}';
  }
}
