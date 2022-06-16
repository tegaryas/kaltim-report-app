import 'package:auto_route/auto_route.dart';
import 'package:kaltim_report/modules/auth/screens/login_screen.dart';
import 'package:kaltim_report/modules/auth/screens/register_screen.dart';
import 'package:kaltim_report/modules/auth/screens/register_user_data.dart';
import 'package:kaltim_report/modules/auth/screens/reset_password_screen.dart';
import 'package:kaltim_report/modules/call/screens/call_screen.dart';
import 'package:kaltim_report/modules/call/screens/call_wrapper_screen.dart';
import 'package:kaltim_report/modules/covid/screens/covid_wrapper_screen.dart';
import 'package:kaltim_report/modules/covid/screens/vaccination_screen.dart';
import 'package:kaltim_report/modules/emergency/screens/emergency_call_data_validate_screen.dart';
import 'package:kaltim_report/modules/emergency/screens/emergency_call_list_screen.dart';
import 'package:kaltim_report/modules/emergency/screens/emergency_call_screen.dart';
import 'package:kaltim_report/modules/emergency/screens/emergency_call_success_screen.dart';
import 'package:kaltim_report/modules/emergency/screens/emergency_call_wrapper_screen.dart';
import 'package:kaltim_report/modules/gempa_bumi/screens/gempa_bumi_screen.dart';
import 'package:kaltim_report/modules/gempa_bumi/screens/gempa_bumi_wrapper_screen.dart';
import 'package:kaltim_report/modules/home/screens/home_admin_screen.dart';
import 'package:kaltim_report/modules/home/screens/home_admin_wrapper_screen.dart';
import 'package:kaltim_report/modules/home/screens/home_screen.dart';
import 'package:kaltim_report/modules/home/screens/home_screen_wrapper.dart';
import 'package:kaltim_report/modules/navigation/screens/admin_navigation_screen.dart';
import 'package:kaltim_report/modules/navigation/screens/navigation_screen.dart';
import 'package:kaltim_report/modules/news/screens/news_detail_screen.dart';
import 'package:kaltim_report/modules/news/screens/news_screen.dart';
import 'package:kaltim_report/modules/news/screens/news_wrapper_screen.dart';
import 'package:kaltim_report/modules/onboard/screens/onboarding_page.dart';
import 'package:kaltim_report/modules/profile/screens/about_screen.dart';
import 'package:kaltim_report/modules/profile/screens/change_password_screen.dart';
import 'package:kaltim_report/modules/profile/screens/detail_profile_screen.dart';
import 'package:kaltim_report/modules/profile/screens/profile_edit_screen.dart';
import 'package:kaltim_report/modules/profile/screens/profile_admin_screen.dart';
import 'package:kaltim_report/modules/profile/screens/profile_admin_wrapper_screen.dart';
import 'package:kaltim_report/modules/profile/screens/profile_screen.dart';
import 'package:kaltim_report/modules/profile/screens/profile_wrapper_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_add_progress_admin_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_add_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_detail_admin_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_detail_progress_admin_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_detail_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_admin_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_admin_wrapper_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_export_data_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_location_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_detail_progress_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_user_bookmark_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_user_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_wrapper_screen.dart';
import 'package:kaltim_report/modules/splash/splash_screen.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/splash-screen", page: SplashScreen),
    AutoRoute(path: "/onboarding", page: OnboardingScreen),
    AutoRoute(path: "/login", page: LoginScreen),
    AutoRoute(path: "/register", page: RegisterScreen),
    AutoRoute(path: "/register-data", page: RegisterUserDataScreen),
    AutoRoute(path: "/reset-password", page: ResetPasswordScreen),
    AutoRoute(
      path: "/report",
      name: "ReportRouter",
      page: ReportWrapperScreem,
      children: [
        AutoRoute(path: "", page: ReportScreen),
        AutoRoute(path: "detail", page: DetailReportScreen),
        AutoRoute(path: "status", page: ReportDetailProgressScreen),
        AutoRoute(path: "location-maps", page: ReportLocationScreen),
        AutoRoute(path: "detail-admin", page: ReportDetailAdminScreen),
        AutoRoute(path: "status-admin", page: ReportDetailProgressAdminScreen),
        AutoRoute(path: "add-status-admin", page: ReportAddProgressAdminScreen),
        AutoRoute(path: "export-data", page: ReportExportDataScreen),
        AutoRoute(path: "bookmark", page: ReportUserBookmarkScreen),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(path: "/webview", page: WebviewScreen),
    AutoRoute(path: "/add-report", page: AddReportScreen),
    AutoRoute(path: "/my-report", page: ReportUserScreen),
    AutoRoute(path: "/edit-profile", page: ProfileEditScreen),
    AutoRoute(path: "/detail-profile", page: DetailProfileScreen),
    AutoRoute(path: "/change-password", page: ChangePasswordScreen),
    AutoRoute(path: "/about-app", page: AboutScreen),
    AutoRoute(
      path: "/covid",
      name: "CovidRouter",
      page: CovidWrapperScreen,
      children: [
        AutoRoute(
          path: "vaksin-data",
          name: "VaksinDataRoute",
          page: VaccinationScreen,
        ),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(
      path: "/gempa-bumi",
      name: 'GempaBumiRouter',
      page: GempaBumiWrapperScreen,
      children: [
        AutoRoute(path: "", page: GempaBumiScreen),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(
      path: "/emergency-call",
      name: 'EmergencyCallRouter',
      page: EmergencyCallWrapperScreen,
      children: [
        AutoRoute(path: "", page: EmergencyCallDataValidateScreen),
        AutoRoute(path: "add", page: EmergencyCallScreen),
        AutoRoute(path: "list-user", page: EmergencyCallListScreen),
        AutoRoute(path: "success", page: EmergencyCallSuccessScreen),
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(
      path: "/menu",
      page: NavigationScreen,
      children: [
        AutoRoute(
          path: "home",
          name: 'HomeRouter',
          page: HomeWrapperScreen,
          children: [
            AutoRoute(path: '', page: HomeScreen),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: "news",
          name: 'NewsRouter',
          page: NewsWrapperScreen,
          children: [
            AutoRoute(path: '', page: NewsScreen),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: "call",
          name: 'CallRouter',
          page: CallWrapperScreen,
          children: [
            AutoRoute(path: '', page: CallScreen),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: "profile",
          name: 'ProfileRouter',
          page: ProfileWrapperScreen,
          children: [
            AutoRoute(path: '', page: ProfileScreen),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
      ],
    ),
    AutoRoute(
      path: "/menu-admin",
      page: AdminNavigationScreen,
      children: [
        AutoRoute(
          path: "home-admin",
          name: 'HomeAdminRouter',
          page: HomeAdminWrapperScreen,
          children: [
            AutoRoute(path: '', page: HomeAdminScreen),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: "report-admin",
          name: 'ReportAdminRouter',
          page: ReportAdminWrapperScreen,
          children: [
            AutoRoute(path: '', page: ReportAdminScreen),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: "profile-admin",
          name: 'ProfileAdminRouter',
          page: ProfileAdminWrapperScreen,
          children: [
            AutoRoute(path: '', page: ProfileAdminScreen),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
