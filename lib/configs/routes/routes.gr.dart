// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../../modules/auth/screens/login_screen.dart' as _i2;
import '../../modules/auth/screens/register_screen.dart' as _i3;
import '../../modules/auth/screens/register_user_data.dart' as _i4;
import '../../modules/call/screens/call_screen.dart' as _i9;
import '../../modules/home/screens/home_screen.dart' as _i7;
import '../../modules/navigation/screens/navigation_screen.dart' as _i6;
import '../../modules/news/screens/news_screen.dart' as _i8;
import '../../modules/onboard/screens/onboarding_page.dart' as _i1;
import '../../modules/profile/screens/profile_screen.dart' as _i10;
import '../../modules/report/screens/report_screen.dart' as _i5;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OnboardingScreen());
    },
    LoginRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterScreen());
    },
    RegisterUserDataRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterUserDataRouteArgs>();
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.RegisterUserDataScreen(key: args.key, email: args.email));
    },
    ReportRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ReportScreen());
    },
    NavigationRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.NavigationScreen());
    },
    HomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.HomeScreen());
    },
    NewsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.NewsScreen());
    },
    CallRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.CallScreen());
    },
    ProfileRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ProfileScreen());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(OnboardingRoute.name, path: '/onboarding'),
        _i11.RouteConfig(LoginRoute.name, path: '/login'),
        _i11.RouteConfig(RegisterRoute.name, path: '/register'),
        _i11.RouteConfig(RegisterUserDataRoute.name, path: '/register-data'),
        _i11.RouteConfig(ReportRoute.name, path: '/report'),
        _i11.RouteConfig(NavigationRoute.name, path: '/menu', children: [
          _i11.RouteConfig(HomeRoute.name,
              path: 'home', parent: NavigationRoute.name),
          _i11.RouteConfig(NewsRoute.name,
              path: 'news', parent: NavigationRoute.name),
          _i11.RouteConfig(CallRoute.name,
              path: 'call', parent: NavigationRoute.name),
          _i11.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: NavigationRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingRoute extends _i11.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: '/onboarding');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.RegisterUserDataScreen]
class RegisterUserDataRoute
    extends _i11.PageRouteInfo<RegisterUserDataRouteArgs> {
  RegisterUserDataRoute({_i12.Key? key, required String email})
      : super(RegisterUserDataRoute.name,
            path: '/register-data',
            args: RegisterUserDataRouteArgs(key: key, email: email));

  static const String name = 'RegisterUserDataRoute';
}

class RegisterUserDataRouteArgs {
  const RegisterUserDataRouteArgs({this.key, required this.email});

  final _i12.Key? key;

  final String email;

  @override
  String toString() {
    return 'RegisterUserDataRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i5.ReportScreen]
class ReportRoute extends _i11.PageRouteInfo<void> {
  const ReportRoute() : super(ReportRoute.name, path: '/report');

  static const String name = 'ReportRoute';
}

/// generated route for
/// [_i6.NavigationScreen]
class NavigationRoute extends _i11.PageRouteInfo<void> {
  const NavigationRoute({List<_i11.PageRouteInfo>? children})
      : super(NavigationRoute.name, path: '/menu', initialChildren: children);

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i8.NewsScreen]
class NewsRoute extends _i11.PageRouteInfo<void> {
  const NewsRoute() : super(NewsRoute.name, path: 'news');

  static const String name = 'NewsRoute';
}

/// generated route for
/// [_i9.CallScreen]
class CallRoute extends _i11.PageRouteInfo<void> {
  const CallRoute() : super(CallRoute.name, path: 'call');

  static const String name = 'CallRoute';
}

/// generated route for
/// [_i10.ProfileScreen]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}
