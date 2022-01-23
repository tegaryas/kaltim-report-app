import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/report/blocs/report/report_bloc.dart';

class ReportWrapperScreem extends StatelessWidget {
  const ReportWrapperScreem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReportBloc>(
          create: (context) => getIt.get<ReportBloc>()..add(FetchReportList()),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
