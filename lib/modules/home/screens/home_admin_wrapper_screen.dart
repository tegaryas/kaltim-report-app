import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/emergency/blocs/emergency_call_list/emergency_call_list_bloc.dart';
import 'package:kaltim_report/modules/home/blocs/home_statistic_chart/home_statistic_chart_bloc.dart';
import 'package:kaltim_report/modules/home/blocs/home_statistic_data/home_statistic_data_bloc.dart';

class HomeAdminWrapperScreen extends StatelessWidget {
  const HomeAdminWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeStatisticChartBloc>(
          create: (context) => getIt.get<HomeStatisticChartBloc>()
            ..add(HomeStatisticChartFetch()),
        ),
        BlocProvider<HomeStatisticDataBloc>(
          create: (context) =>
              getIt.get<HomeStatisticDataBloc>()..add(HomeStatisticDataFetch()),
        ),
        BlocProvider<EmergencyCallListBloc>(
          create: (context) =>
              getIt.get<EmergencyCallListBloc>()..add(EmergencyCallListFetch()),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
