import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class ErrorPlaceholder extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final String subtitle;
  const ErrorPlaceholder({
    Key? key,
    this.onTap,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Ionicons.alert_circle,
            color: Colors.red,
            size: 40.sp,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: AppColors.textFaded,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 3.h,
          ),
          CustomButton(
            text: 'Muat Ulang Data',
            onTap: onTap!,
          )
        ],
      ),
    );
  }
}
