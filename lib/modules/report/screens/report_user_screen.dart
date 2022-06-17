import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/constant/assets.gen.dart';
import 'package:kaltim_report/modules/report/blocs/report_user/report_user_bloc.dart';
import 'package:kaltim_report/modules/report/screens/components/report_card.dart';
import 'package:kaltim_report/widgets/widgets.dart';
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
              'Laporanku',
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
                  return _buildWidgetEmpty();
                }
                return _buildWidgetSuccess(context, state);
              } else if (state is ReportUserFailed) {
                return _buildWidgetFailed(context);
              } else {
                return _buildWidgetLoading();
              }
            },
          )),
    );
  }

  Widget _buildWidgetLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildWidgetFailed(BuildContext context) {
    return ErrorPlaceholder(
      title: 'Ups Terjadi Kesalahan',
      subtitle: 'Kamu bisa menekan tombol dibawah ini untuk memuat ulang data',
      onTap: () {
        context.read<ReportUserBloc>().add(FetchReportUserList());
      },
    );
  }

  Widget _buildWidgetEmpty() {
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

  Widget _buildWidgetSuccess(BuildContext context, ReportUserLoaded state) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(
          () => context.read<ReportUserBloc>().add(FetchReportUserList())),
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          itemBuilder: (context, index) {
            final myReports = state.myReports![index];
            return ReportCardComponent(
              onTap: () {
                context.navigateTo(ReportRouter(
                    children: [DetailReportRoute(id: myReports.id)]));
              },
              report: myReports,
              isShowBookmark: false,
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 5.h,
            );
          },
          itemCount: state.myReports!.length),
    );
  }
}
