import 'package:auto_route/auto_route.dart';
import 'package:kaltim_report/modules/auth/screens/login_screen.dart';
import 'package:kaltim_report/modules/auth/screens/register_screen.dart';
import 'package:kaltim_report/modules/auth/screens/register_user_data.dart';
import 'package:kaltim_report/modules/auth/screens/reset_password_screen.dart';
import 'package:kaltim_report/modules/call/screens/call_screen.dart';
import 'package:kaltim_report/modules/call/screens/call_wrapper_screen.dart';
import 'package:kaltim_report/modules/emergency/screens/emergency_call_data_validate_screen.dart';
import 'package:kaltim_report/modules/emergency/screens/emergency_call_screen.dart';
import 'package:kaltim_report/modules/emergency/screens/emergency_call_wrapper_screen.dart';
import 'package:kaltim_report/modules/gempa_bumi/screens/gempa_bumi_screen.dart';
import 'package:kaltim_report/modules/gempa_bumi/screens/gempa_bumi_wrapper_screen.dart';
import 'package:kaltim_report/modules/home/screens/home_screen.dart';
import 'package:kaltim_report/modules/home/screens/home_screen_wrapper.dart';
import 'package:kaltim_report/modules/navigation/screens/navigation_screen.dart';
import 'package:kaltim_report/modules/news/screens/news_detail_screen.dart';
import 'package:kaltim_report/modules/news/screens/news_screen.dart';
import 'package:kaltim_report/modules/news/screens/news_wrapper_screen.dart';
import 'package:kaltim_report/modules/onboard/screens/onboarding_page.dart';
import 'package:kaltim_report/modules/profile/screens/about_screen.dart';
import 'package:kaltim_report/modules/profile/screens/change_password_screen.dart';
import 'package:kaltim_report/modules/profile/screens/detail_profile_screen.dart';
import 'package:kaltim_report/modules/profile/screens/edit_profile_screen.dart';
import 'package:kaltim_report/modules/profile/screens/profile_screen.dart';
import 'package:kaltim_report/modules/profile/screens/profile_wrapper_screen.dart';
import 'package:kaltim_report/modules/report/screens/add_report_screen.dart';
import 'package:kaltim_report/modules/report/screens/detail_report_screen.dart';
import 'package:kaltim_report/modules/report/screens/location_report_screen.dart';
import 'package:kaltim_report/modules/report/screens/my_report_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_screen.dart';
import 'package:kaltim_report/modules/report/screens/report_wrapper_screen.dart';
import 'package:kaltim_report/modules/splash/splash_screen.dart';

@MaterialAutoRouter(
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
        RedirectRoute(path: '*', redirectTo: ''),
      ],
    ),
    AutoRoute(path: "/news-detail", page: NewsDetailScreen),
    AutoRoute(path: "/add-report", page: AddReportScreen),
    AutoRoute(path: "/detail-report", page: DetailReportScreen),
    AutoRoute(path: "/location-maps", page: ReportLocationScreen),
    AutoRoute(path: "/my-report", page: MyReportScreen),
    AutoRoute(path: "/edit-profile", page: EditProfileScreen),
    AutoRoute(path: "/detail-profile", page: DetailProfileScreen),
    AutoRoute(path: "/change-password", page: ChangePasswordScreen),
    AutoRoute(path: "/about-app", page: AboutScreen),
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
        AutoRoute(path: "", page: EmergencyCallScreen),
        AutoRoute(path: "validate-data", page: EmergencyCallDataValidateScreen),
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
  ],
)
class $AppRouter {}
