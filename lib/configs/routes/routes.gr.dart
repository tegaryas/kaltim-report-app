// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i49;
import 'package:flutter/material.dart' as _i50;
import 'package:google_maps_flutter/google_maps_flutter.dart' as _i53;

import '../../modules/auth/screens/login_screen.dart' as _i3;
import '../../modules/auth/screens/register_screen.dart' as _i4;
import '../../modules/auth/screens/register_user_data.dart' as _i5;
import '../../modules/auth/screens/reset_password_screen.dart' as _i6;
import '../../modules/call/screens/call_screen.dart' as _i41;
import '../../modules/call/screens/call_wrapper_screen.dart' as _i37;
import '../../modules/covid/screens/covid_wrapper_screen.dart' as _i15;
import '../../modules/covid/screens/vaccination_screen.dart' as _i29;
import '../../modules/emergency/screens/emergency_call_data_validate_screen.dart'
    as _i31;
import '../../modules/emergency/screens/emergency_call_list_screen.dart'
    as _i33;
import '../../modules/emergency/screens/emergency_call_screen.dart' as _i32;
import '../../modules/emergency/screens/emergency_call_success_screen.dart'
    as _i34;
import '../../modules/emergency/screens/emergency_call_wrapper_screen.dart'
    as _i17;
import '../../modules/gempa_bumi/screens/gempa_bumi_screen.dart' as _i30;
import '../../modules/gempa_bumi/screens/gempa_bumi_wrapper_screen.dart'
    as _i16;
import '../../modules/home/screens/home_admin_screen.dart' as _i46;
import '../../modules/home/screens/home_admin_wrapper_screen.dart' as _i43;
import '../../modules/home/screens/home_screen.dart' as _i39;
import '../../modules/home/screens/home_screen_wrapper.dart' as _i35;
import '../../modules/navigation/screens/admin_navigation_screen.dart' as _i19;
import '../../modules/navigation/screens/navigation_screen.dart' as _i18;
import '../../modules/news/screens/news_screen.dart' as _i40;
import '../../modules/news/screens/news_wrapper_screen.dart' as _i36;
import '../../modules/onboard/screens/onboarding_page.dart' as _i2;
import '../../modules/profile/models/profile_model.dart' as _i51;
import '../../modules/profile/screens/about_screen.dart' as _i14;
import '../../modules/profile/screens/change_password_screen.dart' as _i13;
import '../../modules/profile/screens/detail_profile_screen.dart' as _i12;
import '../../modules/profile/screens/profile_admin_screen.dart' as _i48;
import '../../modules/profile/screens/profile_admin_wrapper_screen.dart'
    as _i45;
import '../../modules/profile/screens/profile_edit_screen.dart' as _i11;
import '../../modules/profile/screens/profile_screen.dart' as _i42;
import '../../modules/profile/screens/profile_wrapper_screen.dart' as _i38;
import '../../modules/report/models/report_model.dart' as _i52;
import '../../modules/report/screens/report_add_progress_admin_screen.dart'
    as _i26;
import '../../modules/report/screens/report_add_screen.dart' as _i9;
import '../../modules/report/screens/report_admin_screen.dart' as _i47;
import '../../modules/report/screens/report_admin_wrapper_screen.dart' as _i44;
import '../../modules/report/screens/report_detail_admin_screen.dart' as _i24;
import '../../modules/report/screens/report_detail_progress_admin_screen.dart'
    as _i25;
import '../../modules/report/screens/report_detail_progress_screen.dart'
    as _i22;
import '../../modules/report/screens/report_detail_screen.dart' as _i21;
import '../../modules/report/screens/report_export_data_screen.dart' as _i27;
import '../../modules/report/screens/report_location_screen.dart' as _i23;
import '../../modules/report/screens/report_screen.dart' as _i20;
import '../../modules/report/screens/report_user_bookmark_screen.dart' as _i28;
import '../../modules/report/screens/report_user_screen.dart' as _i10;
import '../../modules/report/screens/report_wrapper_screen.dart' as _i7;
import '../../modules/splash/splash_screen.dart' as _i1;
import '../../widgets/webview_screen.dart' as _i8;

class AppRouter extends _i49.RootStackRouter {
  AppRouter([_i50.GlobalKey<_i50.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i49.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    OnboardingRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i2.OnboardingScreen());
    },
    LoginRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i3.LoginScreen());
    },
    RegisterRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i4.RegisterScreen());
    },
    RegisterUserDataRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterUserDataRouteArgs>();
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i5.RegisterUserDataScreen(key: args.key, email: args.email));
    },
    ResetPasswordRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i6.ResetPasswordScreen());
    },
    ReportRouter.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i7.ReportWrapperScreem());
    },
    WebviewRoute.name: (routeData) {
      final args = routeData.argsAs<WebviewRouteArgs>();
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i8.WebviewScreen(
              key: args.key, webUrl: args.webUrl, title: args.title));
    },
    AddReportRoute.name: (routeData) {
      final args = routeData.argsAs<AddReportRouteArgs>(
          orElse: () => const AddReportRouteArgs());
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i9.AddReportScreen(
              key: args.key, reportTitle: args.reportTitle));
    },
    ReportUserRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i10.ReportUserScreen());
    },
    ProfileEditRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileEditRouteArgs>();
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i11.ProfileEditScreen(key: args.key, profile: args.profile));
    },
    DetailProfileRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i12.DetailProfileScreen());
    },
    ChangePasswordRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i13.ChangePasswordScreen());
    },
    AboutRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i14.AboutScreen());
    },
    CovidRouter.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i15.CovidWrapperScreen());
    },
    GempaBumiRouter.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i16.GempaBumiWrapperScreen());
    },
    EmergencyCallRouter.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i17.EmergencyCallWrapperScreen());
    },
    NavigationRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i18.NavigationScreen());
    },
    AdminNavigationRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i19.AdminNavigationScreen());
    },
    ReportRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i20.ReportScreen());
    },
    DetailReportRoute.name: (routeData) {
      final args = routeData.argsAs<DetailReportRouteArgs>();
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i21.DetailReportScreen(key: args.key, id: args.id));
    },
    ReportDetailProgressRoute.name: (routeData) {
      final args = routeData.argsAs<ReportDetailProgressRouteArgs>();
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i22.ReportDetailProgressScreen(
              key: args.key, progress: args.progress));
    },
    ReportLocationRoute.name: (routeData) {
      final args = routeData.argsAs<ReportLocationRouteArgs>();
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i23.ReportLocationScreen(key: args.key, latLng: args.latLng));
    },
    ReportDetailAdminRoute.name: (routeData) {
      final args = routeData.argsAs<ReportDetailAdminRouteArgs>();
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i24.ReportDetailAdminScreen(key: args.key, id: args.id));
    },
    ReportDetailProgressAdminRoute.name: (routeData) {
      final args = routeData.argsAs<ReportDetailProgressAdminRouteArgs>();
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i25.ReportDetailProgressAdminScreen(
              key: args.key, progress: args.progress, id: args.id));
    },
    ReportAddProgressAdminRoute.name: (routeData) {
      final args = routeData.argsAs<ReportAddProgressAdminRouteArgs>();
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i26.ReportAddProgressAdminScreen(key: args.key, id: args.id));
    },
    ReportExportDataRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i27.ReportExportDataScreen());
    },
    ReportUserBookmarkRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i28.ReportUserBookmarkScreen());
    },
    VaksinDataRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i29.VaccinationScreen());
    },
    GempaBumiRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i30.GempaBumiScreen());
    },
    EmergencyCallDataValidateRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: const _i31.EmergencyCallDataValidateScreen());
    },
    EmergencyCallRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i32.EmergencyCallScreen());
    },
    EmergencyCallListRoute.name: (routeData) {
      final args = routeData.argsAs<EmergencyCallListRouteArgs>();
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i33.EmergencyCallListScreen(
              key: args.key, isAdmin: args.isAdmin));
    },
    EmergencyCallSuccessRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i34.EmergencyCallSuccessScreen());
    },
    HomeRouter.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i35.HomeWrapperScreen());
    },
    NewsRouter.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i36.NewsWrapperScreen());
    },
    CallRouter.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i37.CallWrapperScreen());
    },
    ProfileRouter.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i38.ProfileWrapperScreen());
    },
    HomeRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i39.HomeScreen());
    },
    NewsRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i40.NewsScreen());
    },
    CallRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i41.CallScreen());
    },
    ProfileRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i42.ProfileScreen());
    },
    HomeAdminRouter.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i43.HomeAdminWrapperScreen());
    },
    ReportAdminRouter.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i44.ReportAdminWrapperScreen());
    },
    ProfileAdminRouter.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i45.ProfileAdminWrapperScreen());
    },
    HomeAdminRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i46.HomeAdminScreen());
    },
    ReportAdminRoute.name: (routeData) {
      final args = routeData.argsAs<ReportAdminRouteArgs>(
          orElse: () => const ReportAdminRouteArgs());
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData,
          child: _i47.ReportAdminScreen(
              key: args.key, initialIndex: args.initialIndex));
    },
    ProfileAdminRoute.name: (routeData) {
      return _i49.CupertinoPageX<dynamic>(
          routeData: routeData, child: const _i48.ProfileAdminScreen());
    }
  };

  @override
  List<_i49.RouteConfig> get routes => [
        _i49.RouteConfig(SplashRoute.name, path: '/splash-screen'),
        _i49.RouteConfig(OnboardingRoute.name, path: '/onboarding'),
        _i49.RouteConfig(LoginRoute.name, path: '/login'),
        _i49.RouteConfig(RegisterRoute.name, path: '/register'),
        _i49.RouteConfig(RegisterUserDataRoute.name, path: '/register-data'),
        _i49.RouteConfig(ResetPasswordRoute.name, path: '/reset-password'),
        _i49.RouteConfig(ReportRouter.name, path: '/report', children: [
          _i49.RouteConfig(ReportRoute.name,
              path: '', parent: ReportRouter.name),
          _i49.RouteConfig(DetailReportRoute.name,
              path: 'detail', parent: ReportRouter.name),
          _i49.RouteConfig(ReportDetailProgressRoute.name,
              path: 'status', parent: ReportRouter.name),
          _i49.RouteConfig(ReportLocationRoute.name,
              path: 'location-maps', parent: ReportRouter.name),
          _i49.RouteConfig(ReportDetailAdminRoute.name,
              path: 'detail-admin', parent: ReportRouter.name),
          _i49.RouteConfig(ReportDetailProgressAdminRoute.name,
              path: 'status-admin', parent: ReportRouter.name),
          _i49.RouteConfig(ReportAddProgressAdminRoute.name,
              path: 'add-status-admin', parent: ReportRouter.name),
          _i49.RouteConfig(ReportExportDataRoute.name,
              path: 'export-data', parent: ReportRouter.name),
          _i49.RouteConfig(ReportUserBookmarkRoute.name,
              path: 'bookmark', parent: ReportRouter.name),
          _i49.RouteConfig('*#redirect',
              path: '*',
              parent: ReportRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i49.RouteConfig(WebviewRoute.name, path: '/webview'),
        _i49.RouteConfig(AddReportRoute.name, path: '/add-report'),
        _i49.RouteConfig(ReportUserRoute.name, path: '/my-report'),
        _i49.RouteConfig(ProfileEditRoute.name, path: '/edit-profile'),
        _i49.RouteConfig(DetailProfileRoute.name, path: '/detail-profile'),
        _i49.RouteConfig(ChangePasswordRoute.name, path: '/change-password'),
        _i49.RouteConfig(AboutRoute.name, path: '/about-app'),
        _i49.RouteConfig(CovidRouter.name, path: '/covid', children: [
          _i49.RouteConfig(VaksinDataRoute.name,
              path: 'vaksin-data', parent: CovidRouter.name),
          _i49.RouteConfig('*#redirect',
              path: '*',
              parent: CovidRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i49.RouteConfig(GempaBumiRouter.name, path: '/gempa-bumi', children: [
          _i49.RouteConfig(GempaBumiRoute.name,
              path: '', parent: GempaBumiRouter.name),
          _i49.RouteConfig('*#redirect',
              path: '*',
              parent: GempaBumiRouter.name,
              redirectTo: '',
              fullMatch: true)
        ]),
        _i49.RouteConfig(EmergencyCallRouter.name,
            path: '/emergency-call',
            children: [
              _i49.RouteConfig(EmergencyCallDataValidateRoute.name,
                  path: '', parent: EmergencyCallRouter.name),
              _i49.RouteConfig(EmergencyCallRoute.name,
                  path: 'add', parent: EmergencyCallRouter.name),
              _i49.RouteConfig(EmergencyCallListRoute.name,
                  path: 'list-user', parent: EmergencyCallRouter.name),
              _i49.RouteConfig(EmergencyCallSuccessRoute.name,
                  path: 'success', parent: EmergencyCallRouter.name),
              _i49.RouteConfig('*#redirect',
                  path: '*',
                  parent: EmergencyCallRouter.name,
                  redirectTo: '',
                  fullMatch: true)
            ]),
        _i49.RouteConfig(NavigationRoute.name, path: '/menu', children: [
          _i49.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: NavigationRoute.name,
              children: [
                _i49.RouteConfig(HomeRoute.name,
                    path: '', parent: HomeRouter.name),
                _i49.RouteConfig('*#redirect',
                    path: '*',
                    parent: HomeRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i49.RouteConfig(NewsRouter.name,
              path: 'news',
              parent: NavigationRoute.name,
              children: [
                _i49.RouteConfig(NewsRoute.name,
                    path: '', parent: NewsRouter.name),
                _i49.RouteConfig('*#redirect',
                    path: '*',
                    parent: NewsRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i49.RouteConfig(CallRouter.name,
              path: 'call',
              parent: NavigationRoute.name,
              children: [
                _i49.RouteConfig(CallRoute.name,
                    path: '', parent: CallRouter.name),
                _i49.RouteConfig('*#redirect',
                    path: '*',
                    parent: CallRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          _i49.RouteConfig(ProfileRouter.name,
              path: 'profile',
              parent: NavigationRoute.name,
              children: [
                _i49.RouteConfig(ProfileRoute.name,
                    path: '', parent: ProfileRouter.name),
                _i49.RouteConfig('*#redirect',
                    path: '*',
                    parent: ProfileRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ])
        ]),
        _i49.RouteConfig(AdminNavigationRoute.name,
            path: '/menu-admin',
            children: [
              _i49.RouteConfig(HomeAdminRouter.name,
                  path: 'home-admin',
                  parent: AdminNavigationRoute.name,
                  children: [
                    _i49.RouteConfig(HomeAdminRoute.name,
                        path: '', parent: HomeAdminRouter.name),
                    _i49.RouteConfig('*#redirect',
                        path: '*',
                        parent: HomeAdminRouter.name,
                        redirectTo: '',
                        fullMatch: true)
                  ]),
              _i49.RouteConfig(ReportAdminRouter.name,
                  path: 'report-admin',
                  parent: AdminNavigationRoute.name,
                  children: [
                    _i49.RouteConfig(ReportAdminRoute.name,
                        path: '', parent: ReportAdminRouter.name),
                    _i49.RouteConfig('*#redirect',
                        path: '*',
                        parent: ReportAdminRouter.name,
                        redirectTo: '',
                        fullMatch: true)
                  ]),
              _i49.RouteConfig(ProfileAdminRouter.name,
                  path: 'profile-admin',
                  parent: AdminNavigationRoute.name,
                  children: [
                    _i49.RouteConfig(ProfileAdminRoute.name,
                        path: '', parent: ProfileAdminRouter.name),
                    _i49.RouteConfig('*#redirect',
                        path: '*',
                        parent: ProfileAdminRouter.name,
                        redirectTo: '',
                        fullMatch: true)
                  ])
            ])
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i49.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/splash-screen');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.OnboardingScreen]
class OnboardingRoute extends _i49.PageRouteInfo<void> {
  const OnboardingRoute() : super(OnboardingRoute.name, path: '/onboarding');

  static const String name = 'OnboardingRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i49.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.RegisterScreen]
class RegisterRoute extends _i49.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i5.RegisterUserDataScreen]
class RegisterUserDataRoute
    extends _i49.PageRouteInfo<RegisterUserDataRouteArgs> {
  RegisterUserDataRoute({_i50.Key? key, required String email})
      : super(RegisterUserDataRoute.name,
            path: '/register-data',
            args: RegisterUserDataRouteArgs(key: key, email: email));

  static const String name = 'RegisterUserDataRoute';
}

class RegisterUserDataRouteArgs {
  const RegisterUserDataRouteArgs({this.key, required this.email});

  final _i50.Key? key;

  final String email;

  @override
  String toString() {
    return 'RegisterUserDataRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i6.ResetPasswordScreen]
class ResetPasswordRoute extends _i49.PageRouteInfo<void> {
  const ResetPasswordRoute()
      : super(ResetPasswordRoute.name, path: '/reset-password');

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i7.ReportWrapperScreem]
class ReportRouter extends _i49.PageRouteInfo<void> {
  const ReportRouter({List<_i49.PageRouteInfo>? children})
      : super(ReportRouter.name, path: '/report', initialChildren: children);

  static const String name = 'ReportRouter';
}

/// generated route for
/// [_i8.WebviewScreen]
class WebviewRoute extends _i49.PageRouteInfo<WebviewRouteArgs> {
  WebviewRoute({_i50.Key? key, required String webUrl, required String title})
      : super(WebviewRoute.name,
            path: '/webview',
            args: WebviewRouteArgs(key: key, webUrl: webUrl, title: title));

  static const String name = 'WebviewRoute';
}

class WebviewRouteArgs {
  const WebviewRouteArgs({this.key, required this.webUrl, required this.title});

  final _i50.Key? key;

  final String webUrl;

  final String title;

  @override
  String toString() {
    return 'WebviewRouteArgs{key: $key, webUrl: $webUrl, title: $title}';
  }
}

/// generated route for
/// [_i9.AddReportScreen]
class AddReportRoute extends _i49.PageRouteInfo<AddReportRouteArgs> {
  AddReportRoute({_i50.Key? key, String? reportTitle})
      : super(AddReportRoute.name,
            path: '/add-report',
            args: AddReportRouteArgs(key: key, reportTitle: reportTitle));

  static const String name = 'AddReportRoute';
}

class AddReportRouteArgs {
  const AddReportRouteArgs({this.key, this.reportTitle});

  final _i50.Key? key;

  final String? reportTitle;

  @override
  String toString() {
    return 'AddReportRouteArgs{key: $key, reportTitle: $reportTitle}';
  }
}

/// generated route for
/// [_i10.ReportUserScreen]
class ReportUserRoute extends _i49.PageRouteInfo<void> {
  const ReportUserRoute() : super(ReportUserRoute.name, path: '/my-report');

  static const String name = 'ReportUserRoute';
}

/// generated route for
/// [_i11.ProfileEditScreen]
class ProfileEditRoute extends _i49.PageRouteInfo<ProfileEditRouteArgs> {
  ProfileEditRoute({_i50.Key? key, required _i51.ProfileModel profile})
      : super(ProfileEditRoute.name,
            path: '/edit-profile',
            args: ProfileEditRouteArgs(key: key, profile: profile));

  static const String name = 'ProfileEditRoute';
}

class ProfileEditRouteArgs {
  const ProfileEditRouteArgs({this.key, required this.profile});

  final _i50.Key? key;

  final _i51.ProfileModel profile;

  @override
  String toString() {
    return 'ProfileEditRouteArgs{key: $key, profile: $profile}';
  }
}

/// generated route for
/// [_i12.DetailProfileScreen]
class DetailProfileRoute extends _i49.PageRouteInfo<void> {
  const DetailProfileRoute()
      : super(DetailProfileRoute.name, path: '/detail-profile');

  static const String name = 'DetailProfileRoute';
}

/// generated route for
/// [_i13.ChangePasswordScreen]
class ChangePasswordRoute extends _i49.PageRouteInfo<void> {
  const ChangePasswordRoute()
      : super(ChangePasswordRoute.name, path: '/change-password');

  static const String name = 'ChangePasswordRoute';
}

/// generated route for
/// [_i14.AboutScreen]
class AboutRoute extends _i49.PageRouteInfo<void> {
  const AboutRoute() : super(AboutRoute.name, path: '/about-app');

  static const String name = 'AboutRoute';
}

/// generated route for
/// [_i15.CovidWrapperScreen]
class CovidRouter extends _i49.PageRouteInfo<void> {
  const CovidRouter({List<_i49.PageRouteInfo>? children})
      : super(CovidRouter.name, path: '/covid', initialChildren: children);

  static const String name = 'CovidRouter';
}

/// generated route for
/// [_i16.GempaBumiWrapperScreen]
class GempaBumiRouter extends _i49.PageRouteInfo<void> {
  const GempaBumiRouter({List<_i49.PageRouteInfo>? children})
      : super(GempaBumiRouter.name,
            path: '/gempa-bumi', initialChildren: children);

  static const String name = 'GempaBumiRouter';
}

/// generated route for
/// [_i17.EmergencyCallWrapperScreen]
class EmergencyCallRouter extends _i49.PageRouteInfo<void> {
  const EmergencyCallRouter({List<_i49.PageRouteInfo>? children})
      : super(EmergencyCallRouter.name,
            path: '/emergency-call', initialChildren: children);

  static const String name = 'EmergencyCallRouter';
}

/// generated route for
/// [_i18.NavigationScreen]
class NavigationRoute extends _i49.PageRouteInfo<void> {
  const NavigationRoute({List<_i49.PageRouteInfo>? children})
      : super(NavigationRoute.name, path: '/menu', initialChildren: children);

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i19.AdminNavigationScreen]
class AdminNavigationRoute extends _i49.PageRouteInfo<void> {
  const AdminNavigationRoute({List<_i49.PageRouteInfo>? children})
      : super(AdminNavigationRoute.name,
            path: '/menu-admin', initialChildren: children);

  static const String name = 'AdminNavigationRoute';
}

/// generated route for
/// [_i20.ReportScreen]
class ReportRoute extends _i49.PageRouteInfo<void> {
  const ReportRoute() : super(ReportRoute.name, path: '');

  static const String name = 'ReportRoute';
}

/// generated route for
/// [_i21.DetailReportScreen]
class DetailReportRoute extends _i49.PageRouteInfo<DetailReportRouteArgs> {
  DetailReportRoute({_i50.Key? key, required String id})
      : super(DetailReportRoute.name,
            path: 'detail', args: DetailReportRouteArgs(key: key, id: id));

  static const String name = 'DetailReportRoute';
}

class DetailReportRouteArgs {
  const DetailReportRouteArgs({this.key, required this.id});

  final _i50.Key? key;

  final String id;

  @override
  String toString() {
    return 'DetailReportRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i22.ReportDetailProgressScreen]
class ReportDetailProgressRoute
    extends _i49.PageRouteInfo<ReportDetailProgressRouteArgs> {
  ReportDetailProgressRoute(
      {_i50.Key? key, required List<_i52.ReportProgressModel> progress})
      : super(ReportDetailProgressRoute.name,
            path: 'status',
            args: ReportDetailProgressRouteArgs(key: key, progress: progress));

  static const String name = 'ReportDetailProgressRoute';
}

class ReportDetailProgressRouteArgs {
  const ReportDetailProgressRouteArgs({this.key, required this.progress});

  final _i50.Key? key;

  final List<_i52.ReportProgressModel> progress;

  @override
  String toString() {
    return 'ReportDetailProgressRouteArgs{key: $key, progress: $progress}';
  }
}

/// generated route for
/// [_i23.ReportLocationScreen]
class ReportLocationRoute extends _i49.PageRouteInfo<ReportLocationRouteArgs> {
  ReportLocationRoute({_i50.Key? key, required _i53.LatLng latLng})
      : super(ReportLocationRoute.name,
            path: 'location-maps',
            args: ReportLocationRouteArgs(key: key, latLng: latLng));

  static const String name = 'ReportLocationRoute';
}

class ReportLocationRouteArgs {
  const ReportLocationRouteArgs({this.key, required this.latLng});

  final _i50.Key? key;

  final _i53.LatLng latLng;

  @override
  String toString() {
    return 'ReportLocationRouteArgs{key: $key, latLng: $latLng}';
  }
}

/// generated route for
/// [_i24.ReportDetailAdminScreen]
class ReportDetailAdminRoute
    extends _i49.PageRouteInfo<ReportDetailAdminRouteArgs> {
  ReportDetailAdminRoute({_i50.Key? key, required String id})
      : super(ReportDetailAdminRoute.name,
            path: 'detail-admin',
            args: ReportDetailAdminRouteArgs(key: key, id: id));

  static const String name = 'ReportDetailAdminRoute';
}

class ReportDetailAdminRouteArgs {
  const ReportDetailAdminRouteArgs({this.key, required this.id});

  final _i50.Key? key;

  final String id;

  @override
  String toString() {
    return 'ReportDetailAdminRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i25.ReportDetailProgressAdminScreen]
class ReportDetailProgressAdminRoute
    extends _i49.PageRouteInfo<ReportDetailProgressAdminRouteArgs> {
  ReportDetailProgressAdminRoute(
      {_i50.Key? key,
      required List<_i52.ReportProgressModel> progress,
      required String id})
      : super(ReportDetailProgressAdminRoute.name,
            path: 'status-admin',
            args: ReportDetailProgressAdminRouteArgs(
                key: key, progress: progress, id: id));

  static const String name = 'ReportDetailProgressAdminRoute';
}

class ReportDetailProgressAdminRouteArgs {
  const ReportDetailProgressAdminRouteArgs(
      {this.key, required this.progress, required this.id});

  final _i50.Key? key;

  final List<_i52.ReportProgressModel> progress;

  final String id;

  @override
  String toString() {
    return 'ReportDetailProgressAdminRouteArgs{key: $key, progress: $progress, id: $id}';
  }
}

/// generated route for
/// [_i26.ReportAddProgressAdminScreen]
class ReportAddProgressAdminRoute
    extends _i49.PageRouteInfo<ReportAddProgressAdminRouteArgs> {
  ReportAddProgressAdminRoute({_i50.Key? key, required String id})
      : super(ReportAddProgressAdminRoute.name,
            path: 'add-status-admin',
            args: ReportAddProgressAdminRouteArgs(key: key, id: id));

  static const String name = 'ReportAddProgressAdminRoute';
}

class ReportAddProgressAdminRouteArgs {
  const ReportAddProgressAdminRouteArgs({this.key, required this.id});

  final _i50.Key? key;

  final String id;

  @override
  String toString() {
    return 'ReportAddProgressAdminRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i27.ReportExportDataScreen]
class ReportExportDataRoute extends _i49.PageRouteInfo<void> {
  const ReportExportDataRoute()
      : super(ReportExportDataRoute.name, path: 'export-data');

  static const String name = 'ReportExportDataRoute';
}

/// generated route for
/// [_i28.ReportUserBookmarkScreen]
class ReportUserBookmarkRoute extends _i49.PageRouteInfo<void> {
  const ReportUserBookmarkRoute()
      : super(ReportUserBookmarkRoute.name, path: 'bookmark');

  static const String name = 'ReportUserBookmarkRoute';
}

/// generated route for
/// [_i29.VaccinationScreen]
class VaksinDataRoute extends _i49.PageRouteInfo<void> {
  const VaksinDataRoute() : super(VaksinDataRoute.name, path: 'vaksin-data');

  static const String name = 'VaksinDataRoute';
}

/// generated route for
/// [_i30.GempaBumiScreen]
class GempaBumiRoute extends _i49.PageRouteInfo<void> {
  const GempaBumiRoute() : super(GempaBumiRoute.name, path: '');

  static const String name = 'GempaBumiRoute';
}

/// generated route for
/// [_i31.EmergencyCallDataValidateScreen]
class EmergencyCallDataValidateRoute extends _i49.PageRouteInfo<void> {
  const EmergencyCallDataValidateRoute()
      : super(EmergencyCallDataValidateRoute.name, path: '');

  static const String name = 'EmergencyCallDataValidateRoute';
}

/// generated route for
/// [_i32.EmergencyCallScreen]
class EmergencyCallRoute extends _i49.PageRouteInfo<void> {
  const EmergencyCallRoute() : super(EmergencyCallRoute.name, path: 'add');

  static const String name = 'EmergencyCallRoute';
}

/// generated route for
/// [_i33.EmergencyCallListScreen]
class EmergencyCallListRoute
    extends _i49.PageRouteInfo<EmergencyCallListRouteArgs> {
  EmergencyCallListRoute({_i50.Key? key, required bool isAdmin})
      : super(EmergencyCallListRoute.name,
            path: 'list-user',
            args: EmergencyCallListRouteArgs(key: key, isAdmin: isAdmin));

  static const String name = 'EmergencyCallListRoute';
}

class EmergencyCallListRouteArgs {
  const EmergencyCallListRouteArgs({this.key, required this.isAdmin});

  final _i50.Key? key;

  final bool isAdmin;

  @override
  String toString() {
    return 'EmergencyCallListRouteArgs{key: $key, isAdmin: $isAdmin}';
  }
}

/// generated route for
/// [_i34.EmergencyCallSuccessScreen]
class EmergencyCallSuccessRoute extends _i49.PageRouteInfo<void> {
  const EmergencyCallSuccessRoute()
      : super(EmergencyCallSuccessRoute.name, path: 'success');

  static const String name = 'EmergencyCallSuccessRoute';
}

/// generated route for
/// [_i35.HomeWrapperScreen]
class HomeRouter extends _i49.PageRouteInfo<void> {
  const HomeRouter({List<_i49.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i36.NewsWrapperScreen]
class NewsRouter extends _i49.PageRouteInfo<void> {
  const NewsRouter({List<_i49.PageRouteInfo>? children})
      : super(NewsRouter.name, path: 'news', initialChildren: children);

  static const String name = 'NewsRouter';
}

/// generated route for
/// [_i37.CallWrapperScreen]
class CallRouter extends _i49.PageRouteInfo<void> {
  const CallRouter({List<_i49.PageRouteInfo>? children})
      : super(CallRouter.name, path: 'call', initialChildren: children);

  static const String name = 'CallRouter';
}

/// generated route for
/// [_i38.ProfileWrapperScreen]
class ProfileRouter extends _i49.PageRouteInfo<void> {
  const ProfileRouter({List<_i49.PageRouteInfo>? children})
      : super(ProfileRouter.name, path: 'profile', initialChildren: children);

  static const String name = 'ProfileRouter';
}

/// generated route for
/// [_i39.HomeScreen]
class HomeRoute extends _i49.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i40.NewsScreen]
class NewsRoute extends _i49.PageRouteInfo<void> {
  const NewsRoute() : super(NewsRoute.name, path: '');

  static const String name = 'NewsRoute';
}

/// generated route for
/// [_i41.CallScreen]
class CallRoute extends _i49.PageRouteInfo<void> {
  const CallRoute() : super(CallRoute.name, path: '');

  static const String name = 'CallRoute';
}

/// generated route for
/// [_i42.ProfileScreen]
class ProfileRoute extends _i49.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i43.HomeAdminWrapperScreen]
class HomeAdminRouter extends _i49.PageRouteInfo<void> {
  const HomeAdminRouter({List<_i49.PageRouteInfo>? children})
      : super(HomeAdminRouter.name,
            path: 'home-admin', initialChildren: children);

  static const String name = 'HomeAdminRouter';
}

/// generated route for
/// [_i44.ReportAdminWrapperScreen]
class ReportAdminRouter extends _i49.PageRouteInfo<void> {
  const ReportAdminRouter({List<_i49.PageRouteInfo>? children})
      : super(ReportAdminRouter.name,
            path: 'report-admin', initialChildren: children);

  static const String name = 'ReportAdminRouter';
}

/// generated route for
/// [_i45.ProfileAdminWrapperScreen]
class ProfileAdminRouter extends _i49.PageRouteInfo<void> {
  const ProfileAdminRouter({List<_i49.PageRouteInfo>? children})
      : super(ProfileAdminRouter.name,
            path: 'profile-admin', initialChildren: children);

  static const String name = 'ProfileAdminRouter';
}

/// generated route for
/// [_i46.HomeAdminScreen]
class HomeAdminRoute extends _i49.PageRouteInfo<void> {
  const HomeAdminRoute() : super(HomeAdminRoute.name, path: '');

  static const String name = 'HomeAdminRoute';
}

/// generated route for
/// [_i47.ReportAdminScreen]
class ReportAdminRoute extends _i49.PageRouteInfo<ReportAdminRouteArgs> {
  ReportAdminRoute({_i50.Key? key, int? initialIndex})
      : super(ReportAdminRoute.name,
            path: '',
            args: ReportAdminRouteArgs(key: key, initialIndex: initialIndex));

  static const String name = 'ReportAdminRoute';
}

class ReportAdminRouteArgs {
  const ReportAdminRouteArgs({this.key, this.initialIndex});

  final _i50.Key? key;

  final int? initialIndex;

  @override
  String toString() {
    return 'ReportAdminRouteArgs{key: $key, initialIndex: $initialIndex}';
  }
}

/// generated route for
/// [_i48.ProfileAdminScreen]
class ProfileAdminRoute extends _i49.PageRouteInfo<void> {
  const ProfileAdminRoute() : super(ProfileAdminRoute.name, path: '');

  static const String name = 'ProfileAdminRoute';
}
