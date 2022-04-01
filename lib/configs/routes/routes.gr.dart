// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i32;
import 'package:flutter/material.dart' as _i33;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i35;

import '../../modules/auth/screens/login_screen.dart' as _i3;
import '../../modules/auth/screens/register_screen.dart' as _i4;
import '../../modules/auth/screens/register_user_data.dart' as _i5;
import '../../modules/auth/screens/reset_password_screen.dart' as _i6;
import '../../modules/call/screens/call_screen.dart' as _i30;
import '../../modules/call/screens/call_wrapper_screen.dart' as _i26;
import '../../modules/emergency/screens/emergency_call_data_validate_screen.dart'
    as _i23;
import '../../modules/emergency/screens/emergency_call_screen.dart' as _i22;
import '../../modules/emergency/screens/emergency_call_wrapper_screen.dart'
    as _i18;
import '../../modules/gempa_bumi/screens/gempa_bumi_screen.dart' as _i21;
import '../../modules/gempa_bumi/screens/gempa_bumi_wrapper_screen.dart'
    as _i17;
import '../../modules/home/screens/home_screen.dart' as _i28;
import '../../modules/home/screens/home_screen_wrapper.dart' as _i24;
import '../../modules/navigation/screens/navigation_screen.dart' as _i19;
import '../../modules/news/screens/news_detail_screen.dart' as _i8;
import '../../modules/news/screens/news_screen.dart' as _i29;
import '../../modules/news/screens/news_wrapper_screen.dart' as _i25;
import '../../modules/onboard/screens/onboarding_page.dart' as _i2;
import '../../modules/profile/models/profile_model.dart' as _i36;
import '../../modules/profile/screens/about_screen.dart' as _i16;
import '../../modules/profile/screens/change_password_screen.dart' as _i15;
import '../../modules/profile/screens/detail_profile_screen.dart' as _i14;
import '../../modules/profile/screens/edit_profile_screen.dart' as _i13;
import '../../modules/profile/screens/profile_screen.dart' as _i31;
import '../../modules/profile/screens/profile_wrapper_screen.dart' as _i27;
import '../../modules/report/models/report_model.dart' as _i34;
import '../../modules/report/screens/add_report_screen.dart' as _i9;
import '../../modules/report/screens/detail_report_screen.dart' as _i10;
import '../../modules/report/screens/location_report_screen.dart' as _i11;
import '../../modules/report/screens/my_report_screen.dart' as _i12;
import '../../modules/report/screens/report_screen.dart' as _i20;
import '../../modules/report/screens/report_wrapper_screen.dart' as _i7;
import '../../modules/splash/splash_screen.dart' as _i1;

class AppRouter extends _i32.RootStackRouter {
  AppRouter([_i33.GlobalKey<_i33.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i32.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    OnboardingRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OnboardingScreen());
    },
    LoginRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RegisterScreen());
    },
    RegisterUserDataRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterUserDataRouteArgs>();
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.RegisterUserDataScreen(key: args.key, email: args.email));
    },
    ResetPasswordRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.ResetPasswordScreen());
    },
    ReportRouter.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ReportWrapperScreem());
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.NewsDetailScreen(key: args.key, newsUrl: args.newsUrl));
    },
    AddReportRoute.name: (routeData) {
      final args = routeData.argsAs<AddReportRouteArgs>(
          orElse: () => const AddReportRouteArgs());
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.AddReportScreen(
              key: args.key, reportTitle: args.reportTitle));
    },
    DetailReportRoute.name: (routeData) {
      final args = routeData.argsAs<DetailReportRouteArgs>();
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.DetailReportScreen(key: args.key, report: args.report));
    },
    ReportLocationRoute.name: (routeData) {
      final args = routeData.argsAs<ReportLocationRouteArgs>();
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.ReportLocationScreen(key: args.key, latLng: args.latLng));
    },
    MyReportRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.MyReportScreen());
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i13.EditProfileScreen(key: args.key, profile: args.profile));
    },
    DetailProfileRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.DetailProfileScreen());
    },
    ChangePasswordRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i15.ChangePasswordScreen());
    },
    AboutRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.AboutScreen());
    },
    GempaBumiRouter.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i17.GempaBumiWrapperScreen());
    },
    EmergencyCallRouter.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i18.EmergencyCallWrapperScreen());
    },
    NavigationRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i19.NavigationScreen());
    },
    ReportRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.ReportScreen());
    },
    GempaBumiRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.GempaBumiScreen());
    },
    EmergencyCallRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i22.EmergencyCallScreen());
    },
    EmergencyCallDataValidateRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData,
          child: const _i23.EmergencyCallDataValidateScreen());
    },
    HomeRouter.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.HomeWrapperScreen());
    },
    NewsRouter.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.NewsWrapperScreen());
    },
    CallRouter.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i26.CallWrapperScreen());
    },
    ProfileRouter.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i27.ProfileWrapperScreen());
    },
    HomeRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i28.HomeScreen());
    },
    NewsRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i29.NewsScreen());
    },
    CallRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i30.CallScreen());
    },
    ProfileRoute.name: (routeData) {
      return _i32.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i31.ProfileScreen());
    }
  };

  @override
  List<_i32.RouteConfig> get routes => [
        _i32.RouteConfig(SplashRoute.name, path: '/splash-screen'),
        _i32.RouteConfig(OnboardingRoute.name, path: '/onboarding'),
        _i32.RouteConfig(LoginRoute.name, path: '/login'),
        _i32.RouteConfig(RegisterRoute.name, path: '/register'),
        _i32.RouteConfig(RegisterUserDataRoute.name, path: '/register-data'),
        _i32.RouteConfig(ResetPasswordRoute.name, path: '/reset-password'),
        _i32.RouteConfig(ReportRouter.name, path: '/report', children: [
          _i32.RouteConfig(ReportRoute.name,
              path: '', parent: ReportRouter.name),
          _i32.RouteConfig('*#redirect',
              path: '*',
              parent: ReportRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i32.RouteConfig(NewsDetailRoute.name, path: '/news-detail'),
        _i32.RouteConfig(AddReportRoute.name, path: '/add-report'),
        _i32.RouteConfig(DetailReportRoute.name, path: '/detail-report'),
        _i32.RouteConfig(ReportLocationRoute.name, path: '/location-maps'),
        _i32.RouteConfig(MyReportRoute.name, path: '/my-report'),
        _i32.RouteConfig(EditProfileRoute.name, path: '/edit-profile'),
        _i32.RouteConfig(DetailProfileRoute.name, path: '/detail-profile'),
        _i32.RouteConfig(ChangePasswordRoute.name, path: '/change-password'),
        _i32.RouteConfig(AboutRoute.name, path: '/about-app'),
        _i32.RouteConfig(GempaBumiRouter.name, path: '/gempa-bumi', children: [
          _i32.RouteConfig(GempaBumiRoute.name,
              path: '', parent: GempaBumiRouter.name),
          _i32.RouteConfig('*#redirect',
              path: '*',
              parent: GempaBumiRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i32.RouteConfig(EmergencyCallRouter.name,
            path: '/emergency-call',
            children: [
              _i32.RouteConfig(EmergencyCallRoute.name,
                  path: '', parent: EmergencyCallRouter.name),
              _i32.RouteConfig(EmergencyCallDataValidateRoute.name,
                  path: 'validate-data', parent: EmergencyCallRouter.name),
              _i32.RouteConfig('*#redirect',
                  path: '*',
                  parent: EmergencyCallRouter.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i32.RouteConfig(NavigationRoute.name, path: '/menu', children: [
          _i32.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: NavigationRoute.name,
              children: [
                _i32.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i32.RouteConfig('*#redirect',
                    path: '*',
                    parent: HomeRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i32.RouteConfig(NewsRouter.name,
              path: 'news',
              parent: NavigationRoute.name,
              children: [
                _i32.RouteConfig(NewsRoute.name,
                    path: '', parent: NewsRouter.name),
                _i32.RouteConfig('*#redirect',
                    path: '*',
                    parent: NewsRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i32.RouteConfig(CallRouter.name,
              path: 'call',
              parent: NavigationRoute.name,
              children: [
                _i32.RouteConfig(CallRoute.name,
                    path: '', parent: CallRouter.name),
                _i32.RouteConfig('*#redirect',
                    path: '*',
                    parent: CallRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i32.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: NavigationRoute.name,
              children: [
                _i32.RouteConfig(ProfileRoute.name,
                    path: '', parent: ProfileRouter.name),
                _i32.RouteConfig('*#redirect',
                    path: '*',
                    parent: ProfileRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i32.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash-screen');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingRoute extends _i32.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: '/onboarding');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i32.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterRoute extends _i32.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i5.RegisterUserDataScreen]
class RegisterUserDataRoute
    extends _i32.PageRouteInfo<RegisterUserDataRouteArgs> {
  RegisterUserDataRoute({_i33.Key? key, required String email})
      : super(RegisterUserDataRoute.name,
            path: '/register-data',
            args: RegisterUserDataRouteArgs(key: key, email: email));

  static const String name = 'RegisterUserDataRoute';
}

class RegisterUserDataRouteArgs {
  const RegisterUserDataRouteArgs({this.key, required this.email});

  final _i33.Key? key;

  final String email;

  @override
  String toString() {
    return 'RegisterUserDataRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i6.ResetPasswordScreen]
class ResetPasswordRoute extends _i32.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(ResetPasswordRoute.name, path: '/reset-password');

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i7.ReportWrapperScreem]
class ReportRouter extends _i32.PageRouteInfo<void> {
  const ReportRouter({List<_i32.PageRouteInfo>? children})
      : super(ReportRouter.name, path: '/report', initialChildren: children);

  static const String name = 'ReportRouter';
}

/// generated route for
/// [_i8.NewsDetailScreen]
class NewsDetailRoute extends _i32.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({_i33.Key? key, required String newsUrl})
      : super(NewsDetailRoute.name,
            path: '/news-detail',
            args: NewsDetailRouteArgs(key: key, newsUrl: newsUrl));

  static const String name = 'NewsDetailRoute';
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({this.key, required this.newsUrl});

  final _i33.Key? key;

  final String newsUrl;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, newsUrl: $newsUrl}';
  }
}

/// generated route for
/// [_i9.AddReportScreen]
class AddReportRoute extends _i32.PageRouteInfo<AddReportRouteArgs> {
  AddReportRoute({_i33.Key? key, String? reportTitle})
      : super(AddReportRoute.name,
            path: '/add-report',
            args: AddReportRouteArgs(key: key, reportTitle: reportTitle));

  static const String name = 'AddReportRoute';
}

class AddReportRouteArgs {
  const AddReportRouteArgs({this.key, this.reportTitle});

  final _i33.Key? key;

  final String? reportTitle;

  @override
  String toString() {
    return 'AddReportRouteArgs{key: $key, reportTitle: $reportTitle}';
  }
}

/// generated route for
/// [_i10.DetailReportScreen]
class DetailReportRoute extends _i32.PageRouteInfo<DetailReportRouteArgs> {
  DetailReportRoute({_i33.Key? key, required _i34.ReportModel report})
      : super(DetailReportRoute.name,
            path: '/detail-report',
            args: DetailReportRouteArgs(key: key, report: report));

  static const String name = 'DetailReportRoute';
}

class DetailReportRouteArgs {
  const DetailReportRouteArgs({this.key, required this.report});

  final _i33.Key? key;

  final _i34.ReportModel report;

  @override
  String toString() {
    return 'DetailReportRouteArgs{key: $key, report: $report}';
  }
}

/// generated route for
/// [_i11.ReportLocationScreen]
class ReportLocationRoute extends _i32.PageRouteInfo<ReportLocationRouteArgs> {
  ReportLocationRoute({_i33.Key? key, required _i35.LatLng latLng})
      : super(ReportLocationRoute.name,
            path: '/location-maps',
            args: ReportLocationRouteArgs(key: key, latLng: latLng));

  static const String name = 'ReportLocationRoute';
}

class ReportLocationRouteArgs {
  const ReportLocationRouteArgs({this.key, required this.latLng});

  final _i33.Key? key;

  final _i35.LatLng latLng;

  @override
  String toString() {
    return 'ReportLocationRouteArgs{key: $key, latLng: $latLng}';
  }
}

/// generated route for
/// [_i12.MyReportScreen]
class MyReportRoute extends _i32.PageRouteInfo<void> {
  const MyReportRoute() : super(MyReportRoute.name, path: '/my-report');

  static const String name = 'MyReportRoute';
}

/// generated route for
/// [_i13.EditProfileScreen]
class EditProfileRoute extends _i32.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({_i33.Key? key, required _i36.ProfileModel profile})
      : super(EditProfileRoute.name,
            path: '/edit-profile',
            args: EditProfileRouteArgs(key: key, profile: profile));

  static const String name = 'EditProfileRoute';
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key, required this.profile});

  final _i33.Key? key;

  final _i36.ProfileModel profile;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, profile: $profile}';
  }
}

/// generated route for
/// [_i14.DetailProfileScreen]
class DetailProfileRoute extends _i32.PageRouteInfo<void> {
  const DetailProfileRoute()
      : super(DetailProfileRoute.name, path: '/detail-profile');

  static const String name = 'DetailProfileRoute';
}

/// generated route for
/// [_i15.ChangePasswordScreen]
class ChangePasswordRoute extends _i32.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(ChangePasswordRoute.name, path: '/change-password');

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i16.AboutScreen]
class AboutRoute extends _i32.PageRouteInfo<void> {
  const AboutRoute() : super(AboutRoute.name, path: '/about-app');

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i17.GempaBumiWrapperScreen]
class GempaBumiRouter extends _i32.PageRouteInfo<void> {
  const GempaBumiRouter({List<_i32.PageRouteInfo>? children})
      : super(GempaBumiRouter.name,
            path: '/gempa-bumi', initialChildren: children);

  static const String name = 'GempaBumiRouter';
}

/// generated route for
/// [_i18.EmergencyCallWrapperScreen]
class EmergencyCallRouter extends _i32.PageRouteInfo<void> {
  const EmergencyCallRouter({List<_i32.PageRouteInfo>? children})
      : super(EmergencyCallRouter.name,
            path: '/emergency-call', initialChildren: children);

  static const String name = 'EmergencyCallRouter';
}

/// generated route for
/// [_i19.NavigationScreen]
class NavigationRoute extends _i32.PageRouteInfo<void> {
  const NavigationRoute({List<_i32.PageRouteInfo>? children})
      : super(NavigationRoute.name, path: '/menu', initialChildren: children);

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i20.ReportScreen]
class ReportRoute extends _i32.PageRouteInfo<void> {
  const ReportRoute() : super(ReportRoute.name, path: '');

  static const String name = 'ReportRoute';
}

/// generated route for
/// [_i21.GempaBumiScreen]
class GempaBumiRoute extends _i32.PageRouteInfo<void> {
  const GempaBumiRoute() : super(GempaBumiRoute.name, path: '');

  static const String name = 'GempaBumiRoute';
}

/// generated route for
/// [_i22.EmergencyCallScreen]
class EmergencyCallRoute extends _i32.PageRouteInfo<void> {
  const EmergencyCallRoute() : super(EmergencyCallRoute.name, path: '');

  static const String name = 'EmergencyCallRoute';
}

/// generated route for
/// [_i23.EmergencyCallDataValidateScreen]
class EmergencyCallDataValidateRoute extends _i32.PageRouteInfo<void> {
  const EmergencyCallDataValidateRoute()
      : super(EmergencyCallDataValidateRoute.name, path: 'validate-data');

  static const String name = 'EmergencyCallDataValidateRoute';
}

/// generated route for
/// [_i24.HomeWrapperScreen]
class HomeRouter extends _i32.PageRouteInfo<void> {
  const HomeRouter({List<_i32.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i25.NewsWrapperScreen]
class NewsRouter extends _i32.PageRouteInfo<void> {
  const NewsRouter({List<_i32.PageRouteInfo>? children})
      : super(NewsRouter.name, path: 'news', initialChildren: children);

  static const String name = 'NewsRouter';
}

/// generated route for
/// [_i26.CallWrapperScreen]
class CallRouter extends _i32.PageRouteInfo<void> {
  const CallRouter({List<_i32.PageRouteInfo>? children})
      : super(CallRouter.name, path: 'call', initialChildren: children);

  static const String name = 'CallRouter';
}

/// generated route for
/// [_i27.ProfileWrapperScreen]
class ProfileRouter extends _i32.PageRouteInfo<void> {
  const ProfileRouter({List<_i32.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i28.HomeScreen]
class HomeRoute extends _i32.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i29.NewsScreen]
class NewsRoute extends _i32.PageRouteInfo<void> {
  const NewsRoute() : super(NewsRoute.name, path: '');

  static const String name = 'NewsRoute';
}

/// generated route for
/// [_i30.CallScreen]
class CallRoute extends _i32.PageRouteInfo<void> {
  const CallRoute() : super(CallRoute.name, path: '');

  static const String name = 'CallRoute';
}

/// generated route for
/// [_i31.ProfileScreen]
class ProfileRoute extends _i32.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}
