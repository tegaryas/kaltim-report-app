import 'package:auto_route/auto_route.dart';
import 'package:kaltim_report/modules/auth/screens/login_screen.dart';
import 'package:kaltim_report/modules/home/screens/home_screen.dart';
import 'package:kaltim_report/modules/onboard/screens/onboarding_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(path: "/onboarding", page: OnboardingScreen),
    AutoRoute(path: "/login", page: LoginScreen),
    AutoRoute(path: "/home", page: HomeScreen),
  ],
)
class $AppRouter {}
