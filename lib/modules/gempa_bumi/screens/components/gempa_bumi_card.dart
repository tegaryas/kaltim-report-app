import 'package:flutter/material.dart';
import 'package:kaltim_report/modules/gempa_bumi/models/gempa_bumi_model.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/utils/converter_helper.dart';
import 'package:sizer/sizer.dart';

class GempaBumiCard extends StatelessWidget {
  const GempaBumiCard({
    Key? key,
    required this.entry,
  }) : super(key: key);

  final GempaBumiModel entry;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.radar,
                      size: 12.sp,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      "Wilayah",
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.textFaded,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  entry.wilayah,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  entry.tanggal + "  " + entry.jam,
                  style: TextStyle(
                    fontSize: 9.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                entry.magnitude,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: ConverterHelper.skalaRichterToColor(
                      double.parse(entry.magnitude)),
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                "Skala richter",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: AppColors.textFaded,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
