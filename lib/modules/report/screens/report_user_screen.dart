import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/constant/assets.gen.dart';
import 'package:kaltim_report/modules/report/blocs/report_user/report_user_bloc.dart';

import 'package:kaltim_report/modules/report/screens/components/report_card_list.dart';
import 'package:sizer/sizer.dart';

class ReportUserScreen extends StatelessWidget {
  const ReportUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReportUserBloc>(
          create: (context) =>
              getIt.get<ReportUserBloc>()..add(FetchReportUserList()),
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Laporan Ku',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: BlocBuilder<ReportUserBloc, ReportUserState>(
            builder: (context, state) {
              if (state is ReportUserLoaded) {
                if (state.myReports!.isEmpty) {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 25.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                            Assets.images.onboardingSlide1.path,
                          ),
                        )),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Text(
                        'Kamu Belum Melakukan Pelaporan',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        'Laporan kamu nanti akan kami tampilkan disini',
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ));
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
                            context.navigateTo(ReportRouter(children: [
                              DetailReportRoute(id: myReports.id)
                            ]));
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

              if (state is ReportUserFailed) {
                return const Center(child: Text('Gagal Memuat Laporan'));
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}