import 'package:flutter/material.dart';

import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/utils/converter_helper.dart';
import 'package:kaltim_report/widgets/image_network_builder.dart';
import 'package:sizer/sizer.dart';
import 'package:kaltim_report/constant/assets.gen.dart';

class ReportCardOnList extends StatelessWidget {
  const ReportCardOnList({
    Key? key,
    required this.report,
    this.onTap,
  }) : super(key: key);

  final ReportModel report;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: ImageNetworkBuild(
              imageUrl: report.imageUrl,
              height: 10.h,
              width: 10.h,
            ),
          ),
          SizedBox(
            width: 6.w,
          ),
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
                  height: 1.h,
                ),
                Text(
                  report.problem,
                  style: TextStyle(
                    fontSize: 11.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 0.8.h,
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
          )
        ],
      ),
    );
  }
}
