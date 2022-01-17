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

import '../../modules/auth/screens/login_screen.dart' as _i2;
import '../../modules/home/screens/home_screen.dart' as _i3;
import '../../modules/onboard/screens/onboarding_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OnboardingScreen());
    },
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.HomeScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(OnboardingRoute.name, path: '/onboarding'),
        _i4.RouteConfig(LoginRoute.name, path: '/login'),
        _i4.RouteConfig(HomeRoute.name, path: '/home')
      ];
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingRoute extends _i4.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: '/onboarding');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}
