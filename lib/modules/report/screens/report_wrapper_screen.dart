import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';

import '../blocs/report_list_bloc/report_list_bloc.dart';

class ReportWrapperScreem extends StatelessWidget {
  const ReportWrapperScreem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReportListBloc>(
          create: (context) =>
              getIt.get<ReportListBloc>()..add(const ReportListStarted()),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
