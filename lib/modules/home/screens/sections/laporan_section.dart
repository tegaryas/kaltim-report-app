import 'package:flutter/material.dart';
import 'package:kaltim_report/theme.dart';
import 'package:sizer/sizer.dart';

class LaporanSection extends StatelessWidget {
  const LaporanSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Text(
            'Laporan Anda',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            'Pantau kondisi laporan mu setiap saat dengan mudah',
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.textFaded,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          height: 20.h,
          width: 100.w,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/images/onboarding_slide1.png",
            ),
          )),
        ),
        SizedBox(
          height: 1.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Text(
            'Kalau kamu sudah buat laporan, laporan terakhirmu akan muncul disini.',
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.textFaded,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }
}
