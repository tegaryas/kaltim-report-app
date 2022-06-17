import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/emergency/blocs/emergency_call_list/emergency_call_list_bloc.dart';
import 'package:kaltim_report/modules/emergency/blocs/emergency_call_stream/emergency_call_stream_bloc.dart';
import 'package:kaltim_report/modules/gempa_bumi/blocs/gempa_bumi_bloc/gempa_bumi_bloc.dart';
import 'package:kaltim_report/modules/home/blocs/banner/banner_bloc.dart';
import 'package:kaltim_report/modules/home/blocs/feature/feature_bloc.dart';
import 'package:kaltim_report/modules/home/blocs/home_covid/home_covid_bloc.dart';
import 'package:kaltim_report/modules/home/blocs/home_report/home_report_bloc.dart';
import 'package:kaltim_report/modules/profile/blocs/profile/profile_bloc.dart';

class HomeWrapperScreen extends StatelessWidget {
  const HomeWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GempaBumiBloc>(
          create: (context) =>
              getIt.get<GempaBumiBloc>()..add(GempaBumiFetch()),
        ),
        BlocProvider<FeatureBloc>(
          create: (context) => getIt.get<FeatureBloc>()..add(FeatureFetching()),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => getIt.get<ProfileBloc>()..add(ProfileFetching()),
        ),
        BlocProvider<BannerBloc>(
          create: (context) => getIt.get<BannerBloc>()..add(BannerFetch()),
        ),
        BlocProvider<HomeReportBloc>(
          create: (context) =>
              getIt.get<HomeReportBloc>()..add(HomeReportFetch()),
        ),
        BlocProvider<HomeCovidBloc>(
          create: (context) =>
              getIt.get<HomeCovidBloc>()..add(HomeCovidFetch()),
        ),
        BlocProvider<EmergencyCallStreamBloc>(
          create: (context) => getIt.get<EmergencyCallStreamBloc>()
            ..add(EmergencyCallStreamFetch()),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
