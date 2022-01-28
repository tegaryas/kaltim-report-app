// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i21;

import '../../modules/auth/screens/login_screen.dart' as _i2;
import '../../modules/auth/screens/register_screen.dart' as _i3;
import '../../modules/auth/screens/register_user_data.dart' as _i4;
import '../../modules/call/screens/call_screen.dart' as _i16;
import '../../modules/home/screens/home_screen.dart' as _i14;
import '../../modules/navigation/screens/navigation_screen.dart' as _i12;
import '../../modules/news/screens/news_screen.dart' as _i15;
import '../../modules/onboard/screens/onboarding_page.dart' as _i1;
import '../../modules/profile/models/profile_model.dart' as _i22;
import '../../modules/profile/screens/detail_profile_screen.dart' as _i11;
import '../../modules/profile/screens/edit_profile_screen.dart' as _i10;
import '../../modules/profile/screens/profile_screen.dart' as _i17;
import '../../modules/report/models/report_model.dart' as _i20;
import '../../modules/report/screens/add_report_screen.dart' as _i6;
import '../../modules/report/screens/detail_report_screen.dart' as _i7;
import '../../modules/report/screens/location_report_screen.dart' as _i8;
import '../../modules/report/screens/my_report_screen.dart' as _i9;
import '../../modules/report/screens/report_screen.dart' as _i13;
import '../../modules/report/screens/report_wrapper_screen.dart' as _i5;

class AppRouter extends _i18.RootStackRouter {
  AppRouter([_i19.GlobalKey<_i19.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    OnboardingRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.OnboardingScreen());
    },
    LoginRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterScreen());
    },
    RegisterUserDataRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterUserDataRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.RegisterUserDataScreen(key: args.key, email: args.email));
    },
    ReportRouter.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ReportWrapperScreem());
    },
    AddReportRoute.name: (routeData) {
      final args = routeData.argsAs<AddReportRouteArgs>(
          orElse: () => const AddReportRouteArgs());
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.AddReportScreen(
              key: args.key, reportTitle: args.reportTitle));
    },
    DetailReportRoute.name: (routeData) {
      final args = routeData.argsAs<DetailReportRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.DetailReportScreen(key: args.key, report: args.report));
    },
    ReportLocationRoute.name: (routeData) {
      final args = routeData.argsAs<ReportLocationRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.ReportLocationScreen(key: args.key, latLng: args.latLng));
    },
    MyReportRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.MyReportScreen());
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.EditProfileScreen(key: args.key, profile: args.profile));
    },
    DetailProfileRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.DetailProfileScreen());
    },
    NavigationRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.NavigationScreen());
    },
    ReportRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.ReportScreen());
    },
    HomeRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.HomeScreen());
    },
    NewsRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.NewsScreen());
    },
    CallRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.CallScreen());
    },
    ProfileRoute.name: (routeData) {
      return _i18.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.ProfileScreen());
    }
  };

  @override
  List<_i18.RouteConfig> get routes => [
        _i18.RouteConfig(OnboardingRoute.name, path: '/onboarding'),
        _i18.RouteConfig(LoginRoute.name, path: '/login'),
        _i18.RouteConfig(RegisterRoute.name, path: '/register'),
        _i18.RouteConfig(RegisterUserDataRoute.name, path: '/register-data'),
        _i18.RouteConfig(ReportRouter.name, path: 'report', children: [
          _i18.RouteConfig(ReportRoute.name,
              path: '', parent: ReportRouter.name),
          _i18.RouteConfig('*#redirect',
              path: '*',
              parent: ReportRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i18.RouteConfig(AddReportRoute.name, path: '/add-report'),
        _i18.RouteConfig(DetailReportRoute.name, path: '/detail-report'),
        _i18.RouteConfig(ReportLocationRoute.name, path: '/location-maps'),
        _i18.RouteConfig(MyReportRoute.name, path: '/my-report'),
        _i18.RouteConfig(EditProfileRoute.name, path: '/edit-profile'),
        _i18.RouteConfig(DetailProfileRoute.name, path: '/detail-profile'),
        _i18.RouteConfig(NavigationRoute.name, path: '/menu', children: [
          _i18.RouteConfig(HomeRoute.name,
              path: 'home', parent: NavigationRoute.name),
          _i18.RouteConfig(NewsRoute.name,
              path: 'news', parent: NavigationRoute.name),
          _i18.RouteConfig(CallRoute.name,
              path: 'call', parent: NavigationRoute.name),
          _i18.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: NavigationRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingRoute extends _i18.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: '/onboarding');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i2.LoginScreen]
class LoginRoute extends _i18.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterScreen]
class RegisterRoute extends _i18.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i4.RegisterUserDataScreen]
class RegisterUserDataRoute
    extends _i18.PageRouteInfo<RegisterUserDataRouteArgs> {
  RegisterUserDataRoute({_i19.Key? key, required String email})
      : super(RegisterUserDataRoute.name,
            path: '/register-data',
            args: RegisterUserDataRouteArgs(key: key, email: email));

  static const String name = 'RegisterUserDataRoute';
}

class RegisterUserDataRouteArgs {
  const RegisterUserDataRouteArgs({this.key, required this.email});

  final _i19.Key? key;

  final String email;

  @override
  String toString() {
    return 'RegisterUserDataRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i5.ReportWrapperScreem]
class ReportRouter extends _i18.PageRouteInfo<void> {
  const ReportRouter({List<_i18.PageRouteInfo>? children})
      : super(ReportRouter.name, path: 'report', initialChildren: children);

  static const String name = 'ReportRouter';
}

/// generated route for
/// [_i6.AddReportScreen]
class AddReportRoute extends _i18.PageRouteInfo<AddReportRouteArgs> {
  AddReportRoute({_i19.Key? key, String? reportTitle})
      : super(AddReportRoute.name,
            path: '/add-report',
            args: AddReportRouteArgs(key: key, reportTitle: reportTitle));

  static const String name = 'AddReportRoute';
}

class AddReportRouteArgs {
  const AddReportRouteArgs({this.key, this.reportTitle});

  final _i19.Key? key;

  final String? reportTitle;

  @override
  String toString() {
    return 'AddReportRouteArgs{key: $key, reportTitle: $reportTitle}';
  }
}

/// generated route for
/// [_i7.DetailReportScreen]
class DetailReportRoute extends _i18.PageRouteInfo<DetailReportRouteArgs> {
  DetailReportRoute({_i19.Key? key, required _i20.ReportModel report})
      : super(DetailReportRoute.name,
            path: '/detail-report',
            args: DetailReportRouteArgs(key: key, report: report));

  static const String name = 'DetailReportRoute';
}

class DetailReportRouteArgs {
  const DetailReportRouteArgs({this.key, required this.report});

  final _i19.Key? key;

  final _i20.ReportModel report;

  @override
  String toString() {
    return 'DetailReportRouteArgs{key: $key, report: $report}';
  }
}

/// generated route for
/// [_i8.ReportLocationScreen]
class ReportLocationRoute extends _i18.PageRouteInfo<ReportLocationRouteArgs> {
  ReportLocationRoute({_i19.Key? key, required _i21.LatLng latLng})
      : super(ReportLocationRoute.name,
            path: '/location-maps',
            args: ReportLocationRouteArgs(key: key, latLng: latLng));

  static const String name = 'ReportLocationRoute';
}

class ReportLocationRouteArgs {
  const ReportLocationRouteArgs({this.key, required this.latLng});

  final _i19.Key? key;

  final _i21.LatLng latLng;

  @override
  String toString() {
    return 'ReportLocationRouteArgs{key: $key, latLng: $latLng}';
  }
}

/// generated route for
/// [_i9.MyReportScreen]
class MyReportRoute extends _i18.PageRouteInfo<void> {
  const MyReportRoute() : super(MyReportRoute.name, path: '/my-report');

  static const String name = 'MyReportRoute';
}

/// generated route for
/// [_i10.EditProfileScreen]
class EditProfileRoute extends _i18.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({_i19.Key? key, required _i22.ProfileModel profile})
      : super(EditProfileRoute.name,
            path: '/edit-profile',
            args: EditProfileRouteArgs(key: key, profile: profile));

  static const String name = 'EditProfileRoute';
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key, required this.profile});

  final _i19.Key? key;

  final _i22.ProfileModel profile;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, profile: $profile}';
  }
}

/// generated route for
/// [_i11.DetailProfileScreen]
class DetailProfileRoute extends _i18.PageRouteInfo<void> {
  const DetailProfileRoute()
      : super(DetailProfileRoute.name, path: '/detail-profile');

  static const String name = 'DetailProfileRoute';
}

/// generated route for
/// [_i12.NavigationScreen]
class NavigationRoute extends _i18.PageRouteInfo<void> {
  const NavigationRoute({List<_i18.PageRouteInfo>? children})
      : super(NavigationRoute.name, path: '/menu', initialChildren: children);

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i13.ReportScreen]
class ReportRoute extends _i18.PageRouteInfo<void> {
  const ReportRoute() : super(ReportRoute.name, path: '');

  static const String name = 'ReportRoute';
}

/// generated route for
/// [_i14.HomeScreen]
class HomeRoute extends _i18.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i15.NewsScreen]
class NewsRoute extends _i18.PageRouteInfo<void> {
  const NewsRoute() : super(NewsRoute.name, path: 'news');

  static const String name = 'NewsRoute';
}

/// generated route for
/// [_i16.CallScreen]
class CallRoute extends _i18.PageRouteInfo<void> {
  const CallRoute() : super(CallRoute.name, path: 'call');

  static const String name = 'CallRoute';
}

/// generated route for
/// [_i17.ProfileScreen]
class ProfileRoute extends _i18.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}
