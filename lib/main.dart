import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kaltim_report/core/notification/blocs/notification/notification_bloc.dart';
import 'package:kaltim_report/core/notification/blocs/notification_send/notification_send_bloc.dart';
import 'package:kaltim_report/main.extend.dart';
import 'package:kaltim_report/modules/report/blocs/geolocation/geolocation_bloc.dart';
import 'package:kaltim_report/theme.dart';
import 'package:sizer/sizer.dart';

import 'package:kaltim_report/core/auth/bloc/auth_bloc.dart';

import 'configs/injectable/injectable_core.dart';
import 'configs/routes/routes.gr.dart';

Future main() async {
  await setupConfiguration();
  BlocOverrides.runZoned(
    () => runApp(MyApp(appTheme: AppTheme())),
    blocObserver: setupBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final AppTheme appTheme;
  const MyApp({Key? key, required this.appTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final router = getIt.get<AppRouter>();

    return Sizer(builder: (_, __, ___) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(create: (context) => getIt.get<AuthBloc>()),
          BlocProvider<NotificationBloc>(
              create: (context) =>
                  getIt.get<NotificationBloc>()..add(NotificationStarted())),
          BlocProvider<NotificationSendBloc>(
              create: (context) => getIt.get<NotificationSendBloc>()),
          BlocProvider<GeolocationBloc>(
            create: (context) =>
                getIt.get<GeolocationBloc>()..add(LoadGeolocation()),
          ),
        ],
        child: MaterialApp.router(
          routeInformationParser:
              router.defaultRouteParser(includePrefixMatches: true),
          routerDelegate: router.delegate(
            initialDeepLink: const SplashRoute().path,
            navigatorObservers: () => [
              FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
            ],
          ),
          title: 'SIGAP',
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('id'),
          ],
          debugShowCheckedModeBanner: false,
          theme: appTheme.light,
          darkTheme: appTheme.dark,
          builder: (context, child) => MultiBlocListener(
            listeners: [
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthAuthenticated) {
                    router.replaceAll([const NavigationRoute()]);
                  }
                  if (state is AuthAuthenticatedAsAdmin) {
                    router.replaceAll([const AdminNavigationRoute()]);
                  }
                  if (state is AuthUnauthenticated) {
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
