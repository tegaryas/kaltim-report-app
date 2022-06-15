import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/modules/home/blocs/home_statistic_chart/home_statistic_chart_bloc.dart';
import 'package:kaltim_report/modules/home/models/statistic_model.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/widgets/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalysisSection extends StatelessWidget {
  const AnalysisSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
                "Analisis Laporan Desa",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Grafik Laporan Aduan Desa Perkategori",
                style: TextStyle(
                  fontSize: 9.sp,
                  color: AppColors.textFaded,
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<HomeStatisticChartBloc, HomeStatisticChartState>(
          builder: (context, state) {
            if (state is HomeStatisticChartSuccess) {
              if (state.data.isEmpty) {
                return _buildEmpty(context);
              }
              return _buildWIdgetSuccess(context, state);
            } else if (state is HomeStatisticChartFailed) {
              return _buildWidgetFailed(context);
            } else {
              return _buildIWidgetLoading();
            }
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _buildWIdgetSuccess(
      BuildContext context, HomeStatisticChartSuccess state) {
    return SfCircularChart(
      legend: Legend(
        isVisible: true,
        position: LegendPosition.bottom,
        textStyle: TextStyle(
          fontSize: 8.sp,
        ),
      ),
      series: <CircularSeries>[
        PieSeries<DonutChartModel, String>(
          enableTooltip: true,
          dataLabelSettings: DataLabelSettings(
            overflowMode: OverflowMode.shift,
            isVisible: true,
            textStyle: TextStyle(
                fontSize: 9.sp,
                color: Theme.of(context).scaffoldBackgroundColor),
          ),
          explode: true,
          explodeAll: true,
          explodeGesture: ActivationMode.singleTap,
          dataSource: state.data,
          xValueMapper: (DonutChartModel data, _) => data.categoryName,
          yValueMapper: (DonutChartModel data, _) => data.length,
          legendIconType: LegendIconType.circle,
        )
      ],
    );
  }

  Widget _buildWidgetFailed(BuildContext context) {
    return ErrorPlaceholder(
      title: 'Ups Terjadi Kesalahan',
      subtitle: 'Kamu bisa menekan tombol dibawah ini untuk memuat ulang data',
      onTap: () {
        context.read<HomeStatisticChartBloc>().add(HomeStatisticChartFetch());
      },
    );
  }

  Widget _buildIWidgetLoading() {
    return Container();
  }

  Widget _buildEmpty(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 35),
            SizedBox(
              width: 180,
              height: 180,
              child: CircularProgressIndicator(
                strokeWidth: 40,
                value: 1,
                valueColor:
                    AlwaysStoppedAnimation(Theme.of(context).primaryColor),
              ),
            ),
            const SizedBox(height: 33),
            Text(
              "Data Masih Kosong",
              style: TextStyle(
                  fontSize: 10,
                  color: Theme.of(context).textTheme.headline1!.color),
            )
          ],
        ),
      ),
    );
  }
}
