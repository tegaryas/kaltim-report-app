import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/home/blocs/home_statistic_data/home_statistic_data_bloc.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

class StatisticSection extends StatelessWidget {
  const StatisticSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data bulan ini',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Aktivitas yang perlu kamu pantau dari laporan warga',
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: AppColors.textFaded,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<HomeStatisticDataBloc, HomeStatisticDataState>(
              builder: (context, state) {
            if (state is HomeStatisticDataSuccess) {
              return _buildWidgetSuccess(state);
            } else if (state is HomeStatisticDataFailed) {
              return _buildWidgetFailed(context);
            } else {
              return _buildWidgetLoading();
            }
          })
        ],
      ),
    );
  }

  Widget _buildWidgetLoading() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      childAspectRatio: 4 / 1.6,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        _BuildStatisticContainer(
          title: "Total Laporan",
          value: 0,
        ),
        _BuildStatisticContainer(
          title: "Laporan Menunggu",
          value: 0,
        ),
        _BuildStatisticContainer(
          title: "Laporan Selesai",
          value: 0,
        ),
        _BuildStatisticContainer(
          title: "Laporan Diproses",
          value: 0,
        ),
        _BuildStatisticContainer(
          title: "Laporan Ditolak",
          value: 0,
        ),
      ],
    );
  }

  Widget _buildWidgetFailed(BuildContext context) {
    return ErrorPlaceholder(
      title: 'Ups Terjadi Kesalahan',
      subtitle: 'Kamu bisa menekan tombol dibawah ini untuk memuat ulang data',
      onTap: () {
        context.read<HomeStatisticDataBloc>().add(HomeStatisticDataFetch());
      },
    );
  }

  Widget _buildWidgetSuccess(HomeStatisticDataSuccess state) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      childAspectRatio: 4 / 1.6,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _BuildStatisticContainer(
          title: "Total Laporan",
          value: state.data.fold(
              0,
              (previousValue, element) =>
                  previousValue += element?.length ?? 0),
        ),
        _BuildStatisticContainer(
          title: "Laporan Menunggu",
          value: state.data
                  .where(
                      (element) => element?.type == ReportStatusType.menunggu)
                  .toList()
                  .isNotEmpty
              ? state.data
                  .where(
                      (element) => element?.type == ReportStatusType.menunggu)
                  .first!
                  .length
              : 0,
        ),
        _BuildStatisticContainer(
          title: "Laporan Selesai",
          value: state.data
                  .where((element) => element?.type == ReportStatusType.selesai)
                  .toList()
                  .isNotEmpty
              ? state.data
                  .where((element) => element?.type == ReportStatusType.selesai)
                  .first!
                  .length
              : 0,
        ),
        _BuildStatisticContainer(
          title: "Laporan Diproses",
          value: state.data
                  .where((element) => element?.type == ReportStatusType.proses)
                  .toList()
                  .isNotEmpty
              ? state.data
                  .where((element) => element?.type == ReportStatusType.proses)
                  .first!
                  .length
              : 0,
        ),
        _BuildStatisticContainer(
          title: "Laporan Ditolak",
          value: state.data
                  .where(
                      (element) => element?.type == ReportStatusType.tidakValid)
                  .toList()
                  .isNotEmpty
              ? state.data
                  .where(
                      (element) => element?.type == ReportStatusType.tidakValid)
                  .first!
                  .length
              : 0,
        ),
      ],
    );
  }
}

class _BuildStatisticContainer extends StatelessWidget {
  final String title;
  final int value;

  const _BuildStatisticContainer({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          context.navigateTo(
            ReportAdminRouter(
              children: [
                ReportAdminRoute(initialIndex: 1),
              ],
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(1, 1),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 9.sp,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "$value",
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
