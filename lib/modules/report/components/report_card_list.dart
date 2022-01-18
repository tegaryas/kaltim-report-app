import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kaltim_report/modules/home/models/report_model.dart';
import 'package:sizer/sizer.dart';

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
      onTap: onTap ?? () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  report.imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 2.5.h,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 10.sp,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      report.category,
                      style: TextStyle(
                        fontSize: 10.sp,
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
                    fontSize: 12.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  DateFormat.MMMMEEEEd().format(report.dateInput),
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.grey,
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
