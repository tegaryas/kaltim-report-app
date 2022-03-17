import 'package:flutter/material.dart';
import 'package:kaltim_report/theme.dart';
import 'package:sizer/sizer.dart';

class CustomInfoContainer extends StatelessWidget {
  const CustomInfoContainer({
    Key? key,
    this.title,
    this.desc,
  }) : super(key: key);

  final String? title;
  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.lightBlue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Info",
            style: TextStyle(
              fontSize: 8.sp,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(
            title ?? "Update Data Space",
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 0.2.h,
          ),
          Text(
            desc ??
                "Lengkapi lah data dengan teliti, sehingga memudahkan customer dalam melakukan order",
            style: TextStyle(
              color: AppColors.textFaded,
              fontSize: 8.sp,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
