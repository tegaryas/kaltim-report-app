import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/constant/assets.gen.dart';
import 'package:kaltim_report/modules/home/blocs/home_report/home_report_bloc.dart';
import 'package:kaltim_report/modules/report/screens/components/report_card.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/widgets/error_screen_placeholder.dart';
import 'package:sizer/sizer.dart';

class LaporanSection extends StatelessWidget {
  const LaporanSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Text(
            'Laporan Anda',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            'Pantau kondisi laporanmu setiap saat dengan mudah',
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.textFaded,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
        BlocBuilder<HomeReportBloc, HomeReportState>(
          builder: (context, state) {
            if (state is HomeReportSuccess) {
              if (state.data.isEmpty) {
                return _buildReportEmpty();
              }
              return _buildWidgetSuccess(state);
            } else if (state is HomeReportFailed) {
              return _buildWidgetFailed(context);
            } else {
              return ReportCardComponent.loader();
            }
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Divider(
            thickness: 1,
            height: 40,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: InkWell(
            onTap: () {
              context.pushRoute(const ReportUserRoute());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      'Selengkapnya',
                      style: TextStyle(
                        fontSize: 10.sp,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 14.sp,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }

  Widget _buildWidgetFailed(BuildContext context) {
    return ErrorPlaceholder(
      title: 'Ups terjadi kesalahan',
      subtitle: 'Kamu bisa memuat ulang data dengan menekan tombol dibawah ini',
      onTap: () {
        context.read<HomeReportBloc>().add(HomeReportFetch());
      },
    );
  }

  Widget _buildWidgetSuccess(HomeReportSuccess state) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: ReportCardComponent(
            report: state.data[index],
            onTap: () {
              context.navigateTo(ReportRouter(
                  children: [DetailReportRoute(id: state.data[index].id)]));
            },
          ),
        );
      },
      separatorBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Divider(
          height: 5.h,
          thickness: 2,
        ),
      ),
      itemCount: state.data.length,
    );
  }

  Widget _buildReportEmpty() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 20.h,
          width: 100.w,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              Assets.images.onboardingSlide1.path,
            ),
          )),
        ),
        SizedBox(
          height: 1.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Text(
            'Kalau kamu sudah buat laporan, laporan terakhirmu akan muncul disini.',
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textFaded,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
