import 'package:flutter/material.dart';
import 'package:kaltim_report/constant/assets.gen.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/utils/converter_helper.dart';
import 'package:kaltim_report/widgets/image_network_builder.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletons/skeletons.dart';

class ReportCardComponent extends StatelessWidget {
  const ReportCardComponent({Key? key, required this.report, this.onTap})
      : super(key: key);

  final ReportModel report;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          Assets.icons.logoPlain.path,
                          height: 2.h,
                          width: 2.h,
                        ),
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        report.id,
                        style: TextStyle(
                          fontSize: 9.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    report.problem,
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    ConverterHelper.differenceTimeParse(report.dateInput),
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: AppColors.textFaded,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ImageNetworkBuild(
                imageUrl: report.imageUrl,
                height: 10.h,
                width: 10.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget loader() => const _ReportCardLoaderComponent();
}

class _ReportCardLoaderComponent extends StatelessWidget {
  const _ReportCardLoaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle,
              width: 40.sp,
              height: 40.sp,
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                    lines: 2,
                    spacing: 0.8.h,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 10,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                    lines: 1,
                    spacing: 0.8.h,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 10,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
