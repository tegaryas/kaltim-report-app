// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:kaltim_report/modules/report/models/report_model.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// class AdminAnalysisChart extends StatefulWidget {
//   final List<ReportModel> chartData;
//   const AdminAnalysisChart({Key? key, required this.chartData})
//       : super(key: key);

//   @override
//   State<AdminAnalysisChart> createState() => _AdminAnalysisChartState();
// }

// class _AdminAnalysisChartState extends State<AdminAnalysisChart> {
//   @override
//   Widget build(BuildContext context) {
//     return SfCartesianChart(
//       plotAreaBorderWidth: 0,
//       zoomPanBehavior: ZoomPanBehavior(
//           zoomMode: ZoomMode.x,
//           enablePanning: true,
//           enablePinching: true,
//           selectionRectColor: Theme.of(context).primaryColor),
//       legend:
//           Legend(isVisible: false, overflowMode: LegendItemOverflowMode.scroll),
//       primaryXAxis: DateTimeAxis(
//           intervalType: DateTimeIntervalType.days,
//           enableAutoIntervalOnZooming: true,
//           interval: 1,
//           autoScrollingDelta: 5,
//           axisLine: const AxisLine(color: Colors.transparent),
//           labelStyle: TextStyle(
//             color:
//                 Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.6),
//             fontWeight: FontWeight.w400,
//             fontSize: 12,
//           ),
//           dateFormat: DateFormat.MMMMd(),
//           majorGridLines: const MajorGridLines(width: 0)),
//       primaryYAxis: NumericAxis(
//         isVisible: false,
//       ),
//       // series: getDefaultData(widget.chartData),
//     );
//   }

//   List<CartesianSeries<ReportModel, DateTime>> getDefaultData(
//       List<ReportModel> chartData) {
//     return <SplineAreaSeries<ReportModel, DateTime>>[
//       SplineAreaSeries<ReportModel, DateTime>(
//           dataSource: chartData,
//           color: Colors.transparent,
//           borderWidth: 2,
//           borderGradient: LinearGradient(colors: [
//             Theme.of(context).primaryColor.withOpacity(0.2),
//             Theme.of(context).primaryColor
//           ]),
//           xValueMapper: (val, index) => val.dateInput,
//           yValueMapper: (val, index) => val.)
//     ];
//   }
// }
