import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/report/blocs/my_report/my_report_bloc.dart';
import 'package:kaltim_report/modules/report/components/report_card_list.dart';
import 'package:sizer/sizer.dart';

class MyReportScreen extends StatelessWidget {
  const MyReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MyReportBloc>(
          create: (context) =>
              getIt.get<MyReportBloc>()..add(FetchMyReportList()),
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Laporan Ku',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: BlocBuilder<MyReportBloc, MyReportState>(
            builder: (context, state) {
              if (state is MyReportLoaded) {
                if (state.myReports!.isEmpty) {
                  return const Center(child: Text('Kosong'));
                }
                return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    itemBuilder: (context, index) {
                      final myReports = state.myReports![index];
                      return ReportCardOnList(
                          onTap: () {
                            context.router
                                .push(DetailReportRoute(report: myReports));
                          },
                          report: myReports);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 2.5.h,
                      );
                    },
                    itemCount: state.myReports!.length);
              }

              if (state is MyReportFailed) {
                return Text('Gagal Memuat Laporan');
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}
