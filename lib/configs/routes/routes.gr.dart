// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i36;
import 'package:flutter/material.dart' as _i37;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i40;

import '../../modules/auth/screens/login_screen.dart' as _i3;
import '../../modules/auth/screens/register_screen.dart' as _i4;
import '../../modules/auth/screens/register_user_data.dart' as _i5;
import '../../modules/auth/screens/reset_password_screen.dart' as _i6;
import '../../modules/call/screens/call_screen.dart' as _i34;
import '../../modules/call/screens/call_wrapper_screen.dart' as _i30;
import '../../modules/covid/screens/covid_wrapper_screen.dart' as _i15;
import '../../modules/covid/screens/vaccination_screen.dart' as _i24;
import '../../modules/emergency/screens/emergency_call_data_validate_screen.dart'
    as _i27;
import '../../modules/emergency/screens/emergency_call_screen.dart' as _i26;
import '../../modules/emergency/screens/emergency_call_wrapper_screen.dart'
    as _i17;
import '../../modules/gempa_bumi/screens/gempa_bumi_screen.dart' as _i25;
import '../../modules/gempa_bumi/screens/gempa_bumi_wrapper_screen.dart'
    as _i16;
import '../../modules/home/screens/home_screen.dart' as _i32;
import '../../modules/home/screens/home_screen_wrapper.dart' as _i28;
import '../../modules/navigation/screens/admin_navigation_screen.dart' as _i18;
import '../../modules/navigation/screens/navigation_screen.dart' as _i19;
import '../../modules/news/screens/news_detail_screen.dart' as _i8;
import '../../modules/news/screens/news_screen.dart' as _i33;
import '../../modules/news/screens/news_wrapper_screen.dart' as _i29;
import '../../modules/onboard/screens/onboarding_page.dart' as _i2;
import '../../modules/profile/models/profile_model.dart' as _i38;
import '../../modules/profile/screens/about_screen.dart' as _i14;
import '../../modules/profile/screens/change_password_screen.dart' as _i13;
import '../../modules/profile/screens/detail_profile_screen.dart' as _i12;
import '../../modules/profile/screens/edit_profile_screen.dart' as _i11;
import '../../modules/profile/screens/profile_screen.dart' as _i35;
import '../../modules/profile/screens/profile_wrapper_screen.dart' as _i31;
import '../../modules/report/models/report_model.dart' as _i39;
import '../../modules/report/screens/add_report_screen.dart' as _i9;
import '../../modules/report/screens/detail_report_screen.dart' as _i21;
import '../../modules/report/screens/my_report_screen.dart' as _i10;
import '../../modules/report/screens/report_detail_progress_screen.dart'
    as _i22;
import '../../modules/report/screens/report_location_screen.dart' as _i23;
import '../../modules/report/screens/report_screen.dart' as _i20;
import '../../modules/report/screens/report_wrapper_screen.dart' as _i7;
import '../../modules/splash/splash_screen.dart' as _i1;

class AppRouter extends _i36.RootStackRouter {
  AppRouter([_i37.GlobalKey<_i37.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i36.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    OnboardingRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i2.OnboardingScreen());
    },
    LoginRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i4.RegisterScreen());
    },
    RegisterUserDataRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterUserDataRouteArgs>();
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i5.RegisterUserDataScreen(key: args.key, email: args.email));
    },
    ResetPasswordRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i6.ResetPasswordScreen());
    },
    ReportRouter.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i7.ReportWrapperScreem());
    },
    NewsDetailRoute.name: (routeData) {
      final args = routeData.argsAs<NewsDetailRouteArgs>();
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i8.NewsDetailScreen(key: args.key, newsUrl: args.newsUrl));
    },
    AddReportRoute.name: (routeData) {
      final args = routeData.argsAs<AddReportRouteArgs>(
          orElse: () => const AddReportRouteArgs());
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i9.AddReportScreen(
              key: args.key, reportTitle: args.reportTitle));
    },
    MyReportRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i10.MyReportScreen());
    },
    EditProfileRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileRouteArgs>();
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i11.EditProfileScreen(key: args.key, profile: args.profile));
    },
    DetailProfileRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i12.DetailProfileScreen());
    },
    ChangePasswordRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i13.ChangePasswordScreen());
    },
    AboutRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i14.AboutScreen());
    },
    CovidRouter.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i15.CovidWrapperScreen());
    },
    GempaBumiRouter.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i16.GempaBumiWrapperScreen());
    },
    EmergencyCallRouter.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i17.EmergencyCallWrapperScreen());
    },
    AdminNavigationRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i18.AdminNavigationScreen());
    },
    NavigationRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i19.NavigationScreen());
    },
    ReportRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i20.ReportScreen());
    },
    DetailReportRoute.name: (routeData) {
      final args = routeData.argsAs<DetailReportRouteArgs>();
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i21.DetailReportScreen(key: args.key, report: args.report));
    },
    ReportDetailProgressRoute.name: (routeData) {
      final args = routeData.argsAs<ReportDetailProgressRouteArgs>();
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i22.ReportDetailProgressScreen(
              key: args.key, progress: args.progress));
    },
    ReportLocationRoute.name: (routeData) {
      final args = routeData.argsAs<ReportLocationRouteArgs>();
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i23.ReportLocationScreen(key: args.key, latLng: args.latLng));
    },
    VaksinDataRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i24.VaccinationScreen());
    },
    GempaBumiRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i25.GempaBumiScreen());
    },
    EmergencyCallRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i26.EmergencyCallScreen());
    },
    EmergencyCallDataValidateRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: const _i27.EmergencyCallDataValidateScreen());
    },
    HomeRouter.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i28.HomeWrapperScreen());
    },
    NewsRouter.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i29.NewsWrapperScreen());
    },
    CallRouter.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i30.CallWrapperScreen());
    },
    ProfileRouter.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i31.ProfileWrapperScreen());
    },
    HomeRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i32.HomeScreen());
    },
    NewsRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i33.NewsScreen());
    },
    CallRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i34.CallScreen());
    },
    ProfileRoute.name: (routeData) {
      return _i36.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i35.ProfileScreen());
    }
  };

  @override
  List<_i36.RouteConfig> get routes => [
        _i36.RouteConfig(SplashRoute.name, path: '/splash-screen'),
        _i36.RouteConfig(OnboardingRoute.name, path: '/onboarding'),
        _i36.RouteConfig(LoginRoute.name, path: '/login'),
        _i36.RouteConfig(RegisterRoute.name, path: '/register'),
        _i36.RouteConfig(RegisterUserDataRoute.name, path: '/register-data'),
        _i36.RouteConfig(ResetPasswordRoute.name, path: '/reset-password'),
        _i36.RouteConfig(ReportRouter.name, path: '/report', children: [
          _i36.RouteConfig(ReportRoute.name,
              path: '', parent: ReportRouter.name),
          _i36.RouteConfig(DetailReportRoute.name,
              path: 'detail', parent: ReportRouter.name),
          _i36.RouteConfig(ReportDetailProgressRoute.name,
              path: 'status', parent: ReportRouter.name),
          _i36.RouteConfig(ReportLocationRoute.name,
              path: 'location-maps', parent: ReportRouter.name),
          _i36.RouteConfig('*#redirect',
              path: '*',
              parent: ReportRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i36.RouteConfig(NewsDetailRoute.name, path: '/news-detail'),
        _i36.RouteConfig(AddReportRoute.name, path: '/add-report'),
        _i36.RouteConfig(MyReportRoute.name, path: '/my-report'),
        _i36.RouteConfig(EditProfileRoute.name, path: '/edit-profile'),
        _i36.RouteConfig(DetailProfileRoute.name, path: '/detail-profile'),
        _i36.RouteConfig(ChangePasswordRoute.name, path: '/change-password'),
        _i36.RouteConfig(AboutRoute.name, path: '/about-app'),
        _i36.RouteConfig(CovidRouter.name, path: '/covid', children: [
          _i36.RouteConfig(VaksinDataRoute.name,
              path: 'vaksin-data', parent: CovidRouter.name),
          _i36.RouteConfig('*#redirect',
              path: '*',
              parent: CovidRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i36.RouteConfig(GempaBumiRouter.name, path: '/gempa-bumi', children: [
          _i36.RouteConfig(GempaBumiRoute.name,
              path: '', parent: GempaBumiRouter.name),
          _i36.RouteConfig('*#redirect',
              path: '*',
              parent: GempaBumiRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i36.RouteConfig(EmergencyCallRouter.name,
            path: '/emergency-call',
            children: [
              _i36.RouteConfig(EmergencyCallRoute.name,
                  path: '', parent: EmergencyCallRouter.name),
              _i36.RouteConfig(EmergencyCallDataValidateRoute.name,
                  path: 'validate-data', parent: EmergencyCallRouter.name),
              _i36.RouteConfig('*#redirect',
                  path: '*',
                  parent: EmergencyCallRouter.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i36.RouteConfig(AdminNavigationRoute.name, path: '/admin-menu'),
        _i36.RouteConfig(NavigationRoute.name, path: '/menu', children: [
          _i36.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: NavigationRoute.name,
              children: [
                _i36.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i36.RouteConfig('*#redirect',
                    path: '*',
                    parent: HomeRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i36.RouteConfig(NewsRouter.name,
              path: 'news',
              parent: NavigationRoute.name,
              children: [
                _i36.RouteConfig(NewsRoute.name,
                    path: '', parent: NewsRouter.name),
                _i36.RouteConfig('*#redirect',
                    path: '*',
                    parent: NewsRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i36.RouteConfig(CallRouter.name,
              path: 'call',
              parent: NavigationRoute.name,
              children: [
                _i36.RouteConfig(CallRoute.name,
                    path: '', parent: CallRouter.name),
                _i36.RouteConfig('*#redirect',
                    path: '*',
                    parent: CallRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i36.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: NavigationRoute.name,
              children: [
                _i36.RouteConfig(ProfileRoute.name,
                    path: '', parent: ProfileRouter.name),
                _i36.RouteConfig('*#redirect',
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
class SplashRoute extends _i36.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash-screen');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingRoute extends _i36.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: '/onboarding');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i36.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterRoute extends _i36.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i5.RegisterUserDataScreen]
class RegisterUserDataRoute
    extends _i36.PageRouteInfo<RegisterUserDataRouteArgs> {
  RegisterUserDataRoute({_i37.Key? key, required String email})
      : super(RegisterUserDataRoute.name,
            path: '/register-data',
            args: RegisterUserDataRouteArgs(key: key, email: email));

  static const String name = 'RegisterUserDataRoute';
}

class RegisterUserDataRouteArgs {
  const RegisterUserDataRouteArgs({this.key, required this.email});

  final _i37.Key? key;

  final String email;

  @override
  String toString() {
    return 'RegisterUserDataRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i6.ResetPasswordScreen]
class ResetPasswordRoute extends _i36.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(ResetPasswordRoute.name, path: '/reset-password');

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i7.ReportWrapperScreem]
class ReportRouter extends _i36.PageRouteInfo<void> {
  const ReportRouter({List<_i36.PageRouteInfo>? children})
      : super(ReportRouter.name, path: '/report', initialChildren: children);

  static const String name = 'ReportRouter';
}

/// generated route for
/// [_i8.NewsDetailScreen]
class NewsDetailRoute extends _i36.PageRouteInfo<NewsDetailRouteArgs> {
  NewsDetailRoute({_i37.Key? key, required String newsUrl})
      : super(NewsDetailRoute.name,
            path: '/news-detail',
            args: NewsDetailRouteArgs(key: key, newsUrl: newsUrl));

  static const String name = 'NewsDetailRoute';
}

class NewsDetailRouteArgs {
  const NewsDetailRouteArgs({this.key, required this.newsUrl});

  final _i37.Key? key;

  final String newsUrl;

  @override
  String toString() {
    return 'NewsDetailRouteArgs{key: $key, newsUrl: $newsUrl}';
  }
}

/// generated route for
/// [_i9.AddReportScreen]
class AddReportRoute extends _i36.PageRouteInfo<AddReportRouteArgs> {
  AddReportRoute({_i37.Key? key, String? reportTitle})
      : super(AddReportRoute.name,
            path: '/add-report',
            args: AddReportRouteArgs(key: key, reportTitle: reportTitle));

  static const String name = 'AddReportRoute';
}

class AddReportRouteArgs {
  const AddReportRouteArgs({this.key, this.reportTitle});

  final _i37.Key? key;

  final String? reportTitle;

  @override
  String toString() {
    return 'AddReportRouteArgs{key: $key, reportTitle: $reportTitle}';
  }
}

/// generated route for
/// [_i10.MyReportScreen]
class MyReportRoute extends _i36.PageRouteInfo<void> {
  const MyReportRoute() : super(MyReportRoute.name, path: '/my-report');

  static const String name = 'MyReportRoute';
}

/// generated route for
/// [_i11.EditProfileScreen]
class EditProfileRoute extends _i36.PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({_i37.Key? key, required _i38.ProfileModel profile})
      : super(EditProfileRoute.name,
            path: '/edit-profile',
            args: EditProfileRouteArgs(key: key, profile: profile));

  static const String name = 'EditProfileRoute';
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key, required this.profile});

  final _i37.Key? key;

  final _i38.ProfileModel profile;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, profile: $profile}';
  }
}

/// generated route for
/// [_i12.DetailProfileScreen]
class DetailProfileRoute extends _i36.PageRouteInfo<void> {
  const DetailProfileRoute()
      : super(DetailProfileRoute.name, path: '/detail-profile');

  static const String name = 'DetailProfileRoute';
}

/// generated route for
/// [_i13.ChangePasswordScreen]
class ChangePasswordRoute extends _i36.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(ChangePasswordRoute.name, path: '/change-password');

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i14.AboutScreen]
class AboutRoute extends _i36.PageRouteInfo<void> {
  const AboutRoute() : super(AboutRoute.name, path: '/about-app');

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i15.CovidWrapperScreen]
class CovidRouter extends _i36.PageRouteInfo<void> {
  const CovidRouter({List<_i36.PageRouteInfo>? children})
      : super(CovidRouter.name, path: '/covid', initialChildren: children);

  static const String name = 'CovidRouter';
}

/// generated route for
/// [_i16.GempaBumiWrapperScreen]
class GempaBumiRouter extends _i36.PageRouteInfo<void> {
  const GempaBumiRouter({List<_i36.PageRouteInfo>? children})
      : super(GempaBumiRouter.name,
            path: '/gempa-bumi', initialChildren: children);

  static const String name = 'GempaBumiRouter';
}

/// generated route for
/// [_i17.EmergencyCallWrapperScreen]
class EmergencyCallRouter extends _i36.PageRouteInfo<void> {
  const EmergencyCallRouter({List<_i36.PageRouteInfo>? children})
      : super(EmergencyCallRouter.name,
            path: '/emergency-call', initialChildren: children);

  static const String name = 'EmergencyCallRouter';
}

/// generated route for
/// [_i18.AdminNavigationScreen]
class AdminNavigationRoute extends _i36.PageRouteInfo<void> {
  const AdminNavigationRoute()
      : super(AdminNavigationRoute.name, path: '/admin-menu');

  static const String name = 'AdminNavigationRoute';
}

/// generated route for
/// [_i19.NavigationScreen]
class NavigationRoute extends _i36.PageRouteInfo<void> {
  const NavigationRoute({List<_i36.PageRouteInfo>? children})
      : super(NavigationRoute.name, path: '/menu', initialChildren: children);

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i20.ReportScreen]
class ReportRoute extends _i36.PageRouteInfo<void> {
  const ReportRoute() : super(ReportRoute.name, path: '');

  static const String name = 'ReportRoute';
}

/// generated route for
/// [_i21.DetailReportScreen]
class DetailReportRoute extends _i36.PageRouteInfo<DetailReportRouteArgs> {
  DetailReportRoute({_i37.Key? key, required _i39.ReportModel report})
      : super(DetailReportRoute.name,
            path: 'detail',
            args: DetailReportRouteArgs(key: key, report: report));

  static const String name = 'DetailReportRoute';
}

class DetailReportRouteArgs {
  const DetailReportRouteArgs({this.key, required this.report});

  final _i37.Key? key;

  final _i39.ReportModel report;

  @override
  String toString() {
    return 'DetailReportRouteArgs{key: $key, report: $report}';
  }
}

/// generated route for
/// [_i22.ReportDetailProgressScreen]
class ReportDetailProgressRoute
    extends _i36.PageRouteInfo<ReportDetailProgressRouteArgs> {
  ReportDetailProgressRoute(
      {_i37.Key? key, required List<_i39.ReportProgressModel> progress})
      : super(ReportDetailProgressRoute.name,
            path: 'status',
            args: ReportDetailProgressRouteArgs(key: key, progress: progress));

  static const String name = 'ReportDetailProgressRoute';
}

class ReportDetailProgressRouteArgs {
  const ReportDetailProgressRouteArgs({this.key, required this.progress});

  final _i37.Key? key;

  final List<_i39.ReportProgressModel> progress;

  @override
  String toString() {
    return 'ReportDetailProgressRouteArgs{key: $key, progress: $progress}';
  }
}

/// generated route for
/// [_i23.ReportLocationScreen]
class ReportLocationRoute extends _i36.PageRouteInfo<ReportLocationRouteArgs> {
  ReportLocationRoute({_i37.Key? key, required _i40.LatLng latLng})
      : super(ReportLocationRoute.name,
            path: 'location-maps',
            args: ReportLocationRouteArgs(key: key, latLng: latLng));

  static const String name = 'ReportLocationRoute';
}

class ReportLocationRouteArgs {
  const ReportLocationRouteArgs({this.key, required this.latLng});

  final _i37.Key? key;

  final _i40.LatLng latLng;

  @override
  String toString() {
    return 'ReportLocationRouteArgs{key: $key, latLng: $latLng}';
  }
}

/// generated route for
/// [_i24.VaccinationScreen]
class VaksinDataRoute extends _i36.PageRouteInfo<void> {
  const VaksinDataRoute() : super(VaksinDataRoute.name, path: 'vaksin-data');

  static const String name = 'VaksinDataRoute';
}

/// generated route for
/// [_i25.GempaBumiScreen]
class GempaBumiRoute extends _i36.PageRouteInfo<void> {
  const GempaBumiRoute() : super(GempaBumiRoute.name, path: '');

  static const String name = 'GempaBumiRoute';
}

/// generated route for
/// [_i26.EmergencyCallScreen]
class EmergencyCallRoute extends _i36.PageRouteInfo<void> {
  const EmergencyCallRoute() : super(EmergencyCallRoute.name, path: '');

  static const String name = 'EmergencyCallRoute';
}

/// generated route for
/// [_i27.EmergencyCallDataValidateScreen]
class EmergencyCallDataValidateRoute extends _i36.PageRouteInfo<void> {
  const EmergencyCallDataValidateRoute()
      : super(EmergencyCallDataValidateRoute.name, path: 'validate-data');

  static const String name = 'EmergencyCallDataValidateRoute';
}

/// generated route for
/// [_i28.HomeWrapperScreen]
class HomeRouter extends _i36.PageRouteInfo<void> {
  const HomeRouter({List<_i36.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i29.NewsWrapperScreen]
class NewsRouter extends _i36.PageRouteInfo<void> {
  const NewsRouter({List<_i36.PageRouteInfo>? children})
      : super(NewsRouter.name, path: 'news', initialChildren: children);

  static const String name = 'NewsRouter';
}

/// generated route for
/// [_i30.CallWrapperScreen]
class CallRouter extends _i36.PageRouteInfo<void> {
  const CallRouter({List<_i36.PageRouteInfo>? children})
      : super(CallRouter.name, path: 'call', initialChildren: children);

  static const String name = 'CallRouter';
}

/// generated route for
/// [_i31.ProfileWrapperScreen]
class ProfileRouter extends _i36.PageRouteInfo<void> {
  const ProfileRouter({List<_i36.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i32.HomeScreen]
class HomeRoute extends _i36.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i33.NewsScreen]
class NewsRoute extends _i36.PageRouteInfo<void> {
  const NewsRoute() : super(NewsRoute.name, path: '');

  static const String name = 'NewsRoute';
}

/// generated route for
/// [_i34.CallScreen]
class CallRoute extends _i36.PageRouteInfo<void> {
  const CallRoute() : super(CallRoute.name, path: '');

  static const String name = 'CallRoute';
}

/// generated route for
/// [_i35.ProfileScreen]
class ProfileRoute extends _i36.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}
