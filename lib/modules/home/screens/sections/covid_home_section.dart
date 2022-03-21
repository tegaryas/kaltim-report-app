import 'package:flutter/material.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/widgets/image_network_builder.dart';
import 'package:sizer/sizer.dart';

class CovidHomeSection extends StatelessWidget {
  const CovidHomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            'Sangatta Tanggap Covid-19',
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
            'Tetap aman, sehat, dan produktif selama masa pandemi Covid-19',
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.textFaded,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(
          height: 2.5.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            margin: const EdgeInsets.only(
              left: 20,
              bottom: 10,
              top: 10,
            ),
            child: Row(
              children: List.generate(
                3,
                (index) => _buildCardCovidFeature(context),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCardCovidFeature(BuildContext context) {
    return Container(
      height: 18.h,
      width: 32.w,
      margin: const EdgeInsets.only(
        right: 20,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 12,
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(10),
            ),
            child: ImageNetworkBuild(
              imageUrl:
                  "https://dinkes.acehprov.go.id/uploads/Ilustrasi_Vaksinasi1.jpg",
              height: 10.h,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  'Data Vaksinasi',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                Text(
                  'Cek data vaksinasi di daerah mu',
                  style: TextStyle(
                    fontSize: 8.sp,
                    height: 1.5,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
