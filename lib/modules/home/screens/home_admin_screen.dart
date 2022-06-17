import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/constant/constant.dart';
import 'package:kaltim_report/modules/home/blocs/home_statistic_chart/home_statistic_chart_bloc.dart';
import 'package:kaltim_report/modules/home/blocs/home_statistic_data/home_statistic_data_bloc.dart';
import 'package:kaltim_report/modules/home/screens/admin_sections/analysis_section.dart';
import 'package:kaltim_report/modules/home/screens/admin_sections/statistics_section.dart';
import 'package:kaltim_report/modules/home/screens/sections/emergency_call_notification_section.dart';

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        title: Image.asset(
          Assets.icons.logoText.path,
          height: 28,
          fit: BoxFit.fitHeight,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() {
          context.read<HomeStatisticChartBloc>().add(HomeStatisticChartFetch());
          context.read<HomeStatisticDataBloc>().add(HomeStatisticDataFetch());
        }),
        child: ListView(
          children: const [
            StatisticSection(),
            EmergencyCallNotificationSection(isAdmin: true),
            SizedBox(height: 20),
            AnalysisSection(),
          ],
        ),
      ),
    );
  }
}
