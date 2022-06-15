import 'package:flutter/material.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/constant/assets.gen.dart';
import 'package:kaltim_report/modules/profile/models/environment_model.dart';
import 'package:kaltim_report/theme.dart';
import 'package:sizer/sizer.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final envModel = getIt.get<EnvironmentModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tentang Aplikasi',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Theme.of(context).brightness == Brightness.light
                  ? Assets.icons.logoTextLight.path
                  : Assets.icons.logoText.path,
              height: 6.h,
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Version ${envModel.appVersion}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              "SIGAP adalah Platform Aplikasi yang menyediakan layanan dan informasi, yang dapat digunakan untuk semua warga Desa Singa Gembara",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                height: 1.5,
                color: AppColors.textFaded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
