// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i22;
import 'package:flutter/material.dart' as _i23;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i25;

import '../../modules/auth/screens/login_screen.dart' as _i3;
import '../../modules/auth/screens/register_screen.dart' as _i4;
import '../../modules/auth/screens/register_user_data.dart' as _i5;
import '../../modules/auth/screens/reset_password_screen.dart' as _i6;
import '../../modules/call/screens/call_screen.dart' as _i20;
import '../../modules/home/screens/home_screen.dart' as _i18;
import '../../modules/navigation/screens/navigation_screen.dart' as _i16;
import '../../modules/news/screens/news_detail_screen.dart' as _i8;
import '../../modules/news/screens/news_screen.dart' as _i19;
import '../../modules/onboard/screens/onboarding_page.dart' as _i2;
import '../../modules/profile/models/profile_model.dart' as _i26;
import '../../modules/profile/screens/change_password_screen.dart' as _i15;
import '../../modules/profile/screens/detail_profile_screen.dart' as _i14;
import '../../modules/profile/screens/edit_profile_screen.dart' as _i13;
import '../../modules/profile/screens/profile_screen.dart' as _i21;
import '../../modules/report/models/report_model.dart' as _i24;
import '../../modules/report/screens/add_report_screen.dart' as _i9;
import '../../modules/report/screens/detail_report_screen.dart' as _i10;
import '../../modules/report/screens/location_report_screen.dart' as _i11;
import '../../modules/report/screens/my_report_screen.dart' as _i12;
import '../../modules/report/screens/report_screen.dart' as _i17;
import '../../modules/report/screens/report_wrapper_screen.dart' as _i7;
import '../../modules/splash/splash_screen.dart' as _i1;

class AppRouter extends _i22.RootStackRouter {
  AppRouter([_i23.GlobalKey<_i23.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    OnboardingRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OnboardingScreen());
    },
    LoginRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RegisterScreen());
    },
    RegisterUserDataRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterUserDataRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.RegisterUserDataScreen(key: args.key, email: args.email));
    },
    ResetPasswordRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ResetPasswordScreen());
    },
    ReportRouter.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ReportWrapperScreem());
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.NewsDetailScreen(key: args.key, newsUrl: args.newsUrl));
    },
    AddReportRoute.name: (routeData) {
      final args = routeData.argsAs<AddReportRouteArgs>(
          orElse: () => const AddReportRouteArgs());
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.AddReportScreen(
              key: args.key, reportTitle: args.reportTitle));
    },
    DetailReportRoute.name: (routeData) {
      final args = routeData.argsAs<DetailReportRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.DetailReportScreen(key: args.key, report: args.report));
    },
    ReportLocationRoute.name: (routeData) {
      final args = routeData.argsAs<ReportLocationRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.ReportLocationScreen(key: args.key, latLng: args.latLng));
    },
    MyReportRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.MyReportScreen());
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.EditProfileScreen(key: args.key, profile: args.profile));
    },
    DetailProfileRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.DetailProfileScreen());
    },
    ChangePasswordRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.ChangePasswordScreen());
    },
    NavigationRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.NavigationScreen());
    },
    ReportRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.ReportScreen());
    },
    HomeRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.HomeScreen());
    },
    NewsRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.NewsScreen());
    },
    CallRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.CallScreen());
    },
    ProfileRoute.name: (routeData) {
      return _i22.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.ProfileScreen());
    }
  };

  @override
  List<_i22.RouteConfig> get routes => [
        _i22.RouteConfig(SplashRoute.name, path: '/splash-screen'),
        _i22.RouteConfig(OnboardingRoute.name, path: '/onboarding'),
        _i22.RouteConfig(LoginRoute.name, path: '/login'),
        _i22.RouteConfig(RegisterRoute.name, path: '/register'),
        _i22.RouteConfig(RegisterUserDataRoute.name, path: '/register-data'),
        _i22.RouteConfig(ResetPasswordRoute.name, path: '/reset-password'),
        _i22.RouteConfig(ReportRouter.name, path: 'report', children: [
          _i22.RouteConfig(ReportRoute.name,
              path: '', parent: ReportRouter.name),
          _i22.RouteConfig('*#redirect',
              path: '*',
              parent: ReportRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i22.RouteConfig(NewsDetailRoute.name, path: '/news-detail'),
        _i22.RouteConfig(AddReportRoute.name, path: '/add-report'),
        _i22.RouteConfig(DetailReportRoute.name, path: '/detail-report'),
        _i22.RouteConfig(ReportLocationRoute.name, path: '/location-maps'),
        _i22.RouteConfig(MyReportRoute.name, path: '/my-report'),
        _i22.RouteConfig(EditProfileRoute.name, path: '/edit-profile'),
        _i22.RouteConfig(DetailProfileRoute.name, path: '/detail-profile'),
        _i22.RouteConfig(ChangePasswordRoute.name, path: '/change-password'),
        _i22.RouteConfig(NavigationRoute.name, path: '/menu', children: [
          _i22.RouteConfig(HomeRoute.name,
              path: 'home', parent: NavigationRoute.name),
          _i22.RouteConfig(NewsRoute.name,
              path: 'news', parent: NavigationRoute.name),
          _i22.RouteConfig(CallRoute.name,
              path: 'call', parent: NavigationRoute.name),
          _i22.RouteConfig(ProfileRoute.name,
              path: 'profile', parent: NavigationRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i22.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash-screen');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingRoute extends _i22.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: '/onboarding');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i22.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterRoute extends _i22.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i5.RegisterUserDataScreen]
class RegisterUserDataRoute
    extends _i22.PageRouteInfo<RegisterUserDataRouteArgs> {
  RegisterUserDataRoute({_i23.Key? key, required String email})
      : super(RegisterUserDataRoute.name,
            path: '/register-data',
            args: RegisterUserDataRouteArgs(key: key, email: email));

  static const String name = 'RegisterUserDataRoute';
}

class RegisterUserDataRouteArgs {
  const RegisterUserDataRouteArgs({this.key, required this.email});

  final _i23.Key? key;

  final String email;

  @override
  String toString() {
    return 'RegisterUserDataRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i6.ResetPasswordScreen]
class ResetPasswordRoute extends _i22.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(ResetPasswordRoute.name, path: '/reset-password');

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i7.ReportWrapperScreem]
class ReportRouter extends _i22.PageRouteInfo<void> {
  const ReportRouter({List<_i22.PageRouteInfo>? children})
      : super(ReportRouter.name, path: 'report', initialChildren: children);

  static const String name = 'ReportRouter';
}

/// generated route for
/// [_i8.NewsDetailScreen]
class NewsDetailRoute extends _i22.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({_i23.Key? key, required String newsUrl})
      : super(NewsDetailRoute.name,
            path: '/news-detail',
            args: NewsDetailRouteArgs(key: key, newsUrl: newsUrl));

  static const String name = 'NewsDetailRoute';
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({this.key, required this.newsUrl});

  final _i23.Key? key;

  final String newsUrl;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, newsUrl: $newsUrl}';
  }
}

/// generated route for
/// [_i9.AddReportScreen]
class AddReportRoute extends _i22.PageRouteInfo<AddReportRouteArgs> {
  AddReportRoute({_i23.Key? key, String? reportTitle})
      : super(AddReportRoute.name,
            path: '/add-report',
            args: AddReportRouteArgs(key: key, reportTitle: reportTitle));

  static const String name = 'AddReportRoute';
}

class AddReportRouteArgs {
  const AddReportRouteArgs({this.key, this.reportTitle});

  final _i23.Key? key;

  final String? reportTitle;

  @override
  String toString() {
    return 'AddReportRouteArgs{key: $key, reportTitle: $reportTitle}';
  }
}

/// generated route for
/// [_i10.DetailReportScreen]
class DetailReportRoute extends _i22.PageRouteInfo<DetailReportRouteArgs> {
  DetailReportRoute({_i23.Key? key, required _i24.ReportModel report})
      : super(DetailReportRoute.name,
            path: '/detail-report',
            args: DetailReportRouteArgs(key: key, report: report));

  static const String name = 'DetailReportRoute';
}

class DetailReportRouteArgs {
  const DetailReportRouteArgs({this.key, required this.report});

  final _i23.Key? key;

  final _i24.ReportModel report;

  @override
  String toString() {
    return 'DetailReportRouteArgs{key: $key, report: $report}';
  }
}

/// generated route for
/// [_i11.ReportLocationScreen]
class ReportLocationRoute extends _i22.PageRouteInfo<ReportLocationRouteArgs> {
  ReportLocationRoute({_i23.Key? key, required _i25.LatLng latLng})
      : super(ReportLocationRoute.name,
            path: '/location-maps',
            args: ReportLocationRouteArgs(key: key, latLng: latLng));

  static const String name = 'ReportLocationRoute';
}

class ReportLocationRouteArgs {
  const ReportLocationRouteArgs({this.key, required this.latLng});

  final _i23.Key? key;

  final _i25.LatLng latLng;

  @override
  String toString() {
    return 'ReportLocationRouteArgs{key: $key, latLng: $latLng}';
  }
}

/// generated route for
/// [_i12.MyReportScreen]
class MyReportRoute extends _i22.PageRouteInfo<void> {
  const MyReportRoute() : super(MyReportRoute.name, path: '/my-report');

  static const String name = 'MyReportRoute';
}

/// generated route for
/// [_i13.EditProfileScreen]
class EditProfileRoute extends _i22.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({_i23.Key? key, required _i26.ProfileModel profile})
      : super(EditProfileRoute.name,
            path: '/edit-profile',
            args: EditProfileRouteArgs(key: key, profile: profile));

  static const String name = 'EditProfileRoute';
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key, required this.profile});

  final _i23.Key? key;

  final _i26.ProfileModel profile;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, profile: $profile}';
  }
}

/// generated route for
/// [_i14.DetailProfileScreen]
class DetailProfileRoute extends _i22.PageRouteInfo<void> {
  const DetailProfileRoute()
      : super(DetailProfileRoute.name, path: '/detail-profile');

  static const String name = 'DetailProfileRoute';
}

/// generated route for
/// [_i15.ChangePasswordScreen]
class ChangePasswordRoute extends _i22.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(ChangePasswordRoute.name, path: '/change-password');

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i16.NavigationScreen]
class NavigationRoute extends _i22.PageRouteInfo<void> {
  const NavigationRoute({List<_i22.PageRouteInfo>? children})
      : super(NavigationRoute.name, path: '/menu', initialChildren: children);

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i17.ReportScreen]
class ReportRoute extends _i22.PageRouteInfo<void> {
  const ReportRoute() : super(ReportRoute.name, path: '');

  static const String name = 'ReportRoute';
}

/// generated route for
/// [_i18.HomeScreen]
class HomeRoute extends _i22.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i19.NewsScreen]
class NewsRoute extends _i22.PageRouteInfo<void> {
  const NewsRoute() : super(NewsRoute.name, path: 'news');

  static const String name = 'NewsRoute';
}

/// generated route for
/// [_i20.CallScreen]
class CallRoute extends _i22.PageRouteInfo<void> {
  const CallRoute() : super(CallRoute.name, path: 'call');

  static const String name = 'CallRoute';
}

/// generated route for
/// [_i21.ProfileScreen]
class ProfileRoute extends _i22.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile');

  static const String name = 'ProfileRoute';
}
