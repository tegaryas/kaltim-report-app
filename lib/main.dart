import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
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

    return Sizer(builder: (_, __, ___) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
              create: (context) => getIt.get<AuthBloc>()..add(AuthStarted())),
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
            primarySwatch: Colors.blueGrey,
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
        ),
      );
    });
  }
}
