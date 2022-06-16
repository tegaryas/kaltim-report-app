import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

class EmergencyCallSuccessScreen extends StatelessWidget {
  const EmergencyCallSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AutoLeadingButton(),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Iconsax.verify5,
              color: Colors.green,
              size: 70,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Panggilan Darurat Berhasil dibuat!',
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Pastikan handphone anda aktif, sehingga petugas kami segera meluncur kelokasimu. ',
              style: TextStyle(
                fontSize: 9.sp,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
