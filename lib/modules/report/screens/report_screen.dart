import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/home/blocs/report/report_bloc.dart';
import 'package:kaltim_report/modules/report/components/report_card_list.dart';
import 'package:sizer/sizer.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReportBloc>(
          create: (context) => getIt.get<ReportBloc>()..add(ReportFetching()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'SiLapor',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: BlocBuilder<ReportBloc, ReportState>(
          builder: (context, state) {
            if (state is ReportLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ReportLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                itemCount: state.reports.length,
                itemBuilder: (context, index) {
                  var report = state.reports[index];
                  return ReportCardOnList(
                    report: report,
                    onTap: () {
                      context.router.push(
                        DetailReportRoute(report: report),
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 4.5.h,
                  );
                },
              );
            } else {
              return Text('Something Wrong');
            }
          },
        ),
      ),
    );
  }
}
