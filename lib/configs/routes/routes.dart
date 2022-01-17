import 'package:auto_route/auto_route.dart';
import 'package:kaltim_report/modules/auth/screens/login_screen.dart';
import 'package:kaltim_report/modules/auth/screens/register_screen.dart';
import 'package:kaltim_report/modules/auth/screens/register_user_data.dart';
import 'package:kaltim_report/modules/home/screens/home_screen.dart';
import 'package:kaltim_report/modules/onboard/screens/onboarding_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/onboarding", page: OnboardingScreen),
    AutoRoute(path: "/login", page: LoginScreen),
    AutoRoute(path: "/register", page: RegisterScreen),
    AutoRoute(path: "/register-data", page: RegisterUserDataScreen),
    AutoRoute(path: "/home", page: HomeScreen),
  ],
)
class $AppRouter {}
