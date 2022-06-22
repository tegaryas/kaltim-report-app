import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/modules/report/screens/components/status_report_badge.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/utils/converter_helper.dart';
import 'package:kaltim_report/widgets/image_gallery_screen.dart';
import 'package:kaltim_report/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

class ReportDetailProgressAdminScreen extends StatelessWidget {
  final List<ReportProgressModel> progress;
  final String id;
  const ReportDetailProgressAdminScreen({
    Key? key,
    required this.progress,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Riwayat Status Laporan',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      bottomNavigationBar: progress.first.statusType != ReportStatusType.selesai
          ? Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: CustomButton(
                text: 'Tambah Progress',
                onTap: () {
                  context
                      .pushRoute(ReportAddProgressAdminRoute(id: id))
                      .then((value) {
                    if (value == true) {
                      context.popRoute(true);
                    }
                  });
                },
              ),
            )
          : null,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        itemCount: progress.length,
        itemBuilder: (context, index) {
          var progres = progress[index];
          return _buildTimelineCard(context, progres);
        },
      ),
    );
  }

  Widget _buildTimelineCard(BuildContext context, ReportProgressModel progres) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            if (progress.last != progres)
              Container(
                height: progres.description != null && progres.imageUrl != null
                    ? progres.description!.length.toDouble() + 240
                    : progres.imageUrl != null
                        ? 240
                        : progres.description != null
                            ? progres.description!.length.toDouble() + 20
                            : 50,
                margin: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: const VerticalDivider(
                  color: AppColors.textFaded,
                ),
              ),
          ],
        ),
        SizedBox(
          width: 5.w,
        ),
        Expanded(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ConverterHelper.convertDateTimeToFullDateFormat(
                              progres.date, context),
                          style: TextStyle(
                            fontSize: 9.sp,
                            color: AppColors.textFaded,
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(
                          progres.statusProgress,
                          style: TextStyle(
                            fontSize: 10.sp,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  _statusTypeToWidget(progres.statusType),
                ],
              ),
              if (progres.imageUrl != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: InkWell(
                    onTap: () {
                      context.router.pushWidget(
                          ImageGalleryScreen(imageUrls: [progres.imageUrl!]));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ImageNetworkBuild(
                        imageUrl: progres.imageUrl!,
                        height: 180,
                        width: 100.w,
                      ),
                    ),
                  ),
                ),
              if (progres.description != null)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade300
                          : Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      progres.description!,
                      style: TextStyle(
                        fontSize: 10.sp,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _statusTypeToWidget(ReportStatusType status) {
    switch (status) {
      case ReportStatusType.menunggu:
        return const StatusReportBadge(
          status: 'Menunggu',
          backgroundColor: Colors.grey,
        );
      case ReportStatusType.proses:
        return const StatusReportBadge(
          status: 'Proses',
          backgroundColor: Colors.orange,
        );
      case ReportStatusType.selesai:
        return const StatusReportBadge(
          status: 'Selesai',
          backgroundColor: Colors.green,
        );
      case ReportStatusType.tindakLanjut:
        return const StatusReportBadge(
          status: 'Tindak Lanjut',
          backgroundColor: Colors.blue,
        );
      case ReportStatusType.validasi:
        return const StatusReportBadge(
          status: 'Validasi',
          backgroundColor: Colors.amber,
        );
      case ReportStatusType.tidakValid:
        return const StatusReportBadge(
          status: 'Tidak Valid',
          backgroundColor: Colors.black,
        );
      default:
        return Container();
    }
  }
}
