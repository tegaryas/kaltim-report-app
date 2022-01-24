import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/call/blocs/calls/call_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:kaltim_report/core/bloc/auth_bloc.dart';

import 'configs/injectable/injectable_core.dart';
import 'configs/routes/routes.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configureDependencies(Environment.dev);

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = getIt.get<AppRouter>();

    Map<int, Color> colorCodes = {
      50: const Color.fromRGBO(147, 205, 72, .1),
      100: const Color.fromRGBO(147, 205, 72, .2),
      200: const Color.fromRGBO(147, 205, 72, .3),
      300: const Color.fromRGBO(147, 205, 72, .4),
      400: const Color.fromRGBO(147, 205, 72, .5),
      500: const Color.fromRGBO(147, 205, 72, .6),
      600: const Color.fromRGBO(147, 205, 72, .7),
      700: const Color.fromRGBO(147, 205, 72, .8),
      800: const Color.fromRGBO(147, 205, 72, .9),
      900: const Color.fromRGBO(147, 205, 72, 1),
    };

    return Sizer(builder: (_, __, ___) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
              create: (context) => getIt.get<AuthBloc>()..add(AuthStarted())),
          BlocProvider<CallBloc>(
              create: (context) =>
                  getIt.get<CallBloc>()..add(EmergencyCallFetching())),
        ],
        child: MaterialApp.router(
          routeInformationParser:
              router.defaultRouteParser(includePrefixMatches: true),
          routerDelegate: router.delegate(
            initialDeepLink: const OnboardingRoute().path,
          ),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('id'),
          ],
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFFFAFAFA),
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.black,
              ),
            ),
            primarySwatch: MaterialColor(0xFF00DCA7, colorCodes),
            primaryColor: const Color(0xFF00DCA7),
            scaffoldBackgroundColor: const Color(0xFFFAFAFA),
            textTheme: GoogleFonts.montserratTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          builder: (context, child) => MultiBlocListener(
            listeners: [
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthAuthenticated) {
                    router.replaceAll([const NavigationRoute()]);
                  } else if (state is AuthUnauthenticated) {
                    router.replaceAll([const OnboardingRoute()]);
                  }
                },
              ),
            ],
            child: child!,
          ),
          // home: BlocListener<AuthBloc, AuthState>(
          //   listener: (context, state) {
          //     if (state is AuthAuthenticated) {
          //       _navigatorKey.currentState?.pushAndRemoveUntil(
          //           MaterialPageRoute(builder: (context) => const HomeScreen()),
          //           (Route<dynamic> route) => false);
          //     } else if (state is AuthUnauthenticated) {
          //       _navigatorKey.currentState?.pushAndRemoveUntil(
          //           MaterialPageRoute(
          //               builder: (context) => const OnboardingPage()),
          //           (Route<dynamic> route) => false);
          //     }
          //   },
          //   child: BlocBuilder<AuthBloc, AuthState>(
          //     builder: (context, state) {
          //       if (state is AuthAuthenticated) {
          //         return const HomeScreen();
          //       } else if (state is AuthUnauthenticated) {
          //         return const OnboardingPage();
          //       } else if (state is AuthUninitalized) {
          //         return const OnboardingPage();
          //       }
          //       return const Scaffold();
          //     },
          //   ),
          // ),
        ),
      );
    });
  }
}
