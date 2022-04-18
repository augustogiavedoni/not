// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../onboarding/onboarding_screen.dart' as _i2;
import '../sign_in/sign_in_screen.dart' as _i3;
import '../splash/splash_screen.dart' as _i1;

class Router extends _i4.RootStackRouter {
  Router([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    OnboardingScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OnboardingScreen());
    },
    SignInScreenRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.SignInScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i4.RouteConfig(OnboardingScreenRoute.name, path: '/onboarding-screen'),
        _i4.RouteConfig(SignInScreenRoute.name, path: '/sign-in-screen')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i4.PageRouteInfo<void> {
  const SplashScreenRoute() : super(SplashScreenRoute.name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingScreenRoute extends _i4.PageRouteInfo<void> {
  const OnboardingScreenRoute()
      : super(OnboardingScreenRoute.name, path: '/onboarding-screen');

  static const String name = 'OnboardingScreenRoute';
}

/// generated route for
/// [_i3.SignInScreen]
class SignInScreenRoute extends _i4.PageRouteInfo<void> {
  const SignInScreenRoute()
      : super(SignInScreenRoute.name, path: '/sign-in-screen');

  static const String name = 'SignInScreenRoute';
}
