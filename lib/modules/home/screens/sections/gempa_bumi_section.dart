import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/gempa_bumi/blocs/gempa_bumi_bloc/gempa_bumi_bloc.dart';
import 'package:kaltim_report/modules/report/blocs/geolocation/geolocation_bloc.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/utils/converter_helper.dart';
import 'package:kaltim_report/widgets/custom_button.dart';
import 'package:kaltim_report/widgets/error_screen_placeholder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletons/skeletons.dart';

class GempaBumiHomeSection extends StatelessWidget {
  const GempaBumiHomeSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GempaBumiBloc, GempaBumiState>(
      builder: (context, state) {
        if (state is GempaBumiSuccess) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).errorColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.wifi_tethering,
                        color: Colors.white,
                        size: 12.sp,
                      ),
                      SizedBox(
                        width: 1.w,
                      ),
                      Text(
                        "Live",
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "Gempa Bumi Terkini",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).errorColor,
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  "Kamu bisa dapatkan info terkini terkait gempa di Indonesia",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.textFaded,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
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
                            state.data.wilayah,
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
                            "${state.data.tanggal}  ${state.data.jam}",
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
                          state.data.magnitude,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: ConverterHelper.skalaRichterToColor(
                                double.parse(state.data.magnitude)),
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
                const Divider(
                  thickness: 1,
                  height: 40,
                ),
                InkWell(
                  onTap: () {
                    checkLocationPermission(context, wantNavigated: true);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Selengkapnya',
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 14.sp,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        } else if (state is GempaBumiFailed) {
          return ErrorPlaceholder(
            title: 'Ups ada kesalahan nih!',
            subtitle:
                'Kamu bisa memuat ulang data gempa bumi dengan menekan tombol dibawah ini ya',
            onTap: () {
              context.read<GempaBumiBloc>().add(GempaBumiFetch());
            },
          );
        } else {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonParagraph(
                  style: const SkeletonParagraphStyle(
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 10,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SkeletonParagraph(
                  style: const SkeletonParagraphStyle(
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 10,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Future<void> checkLocationPermission(BuildContext context,
      {bool? wantNavigated}) async {
    var status = await Permission.locationWhenInUse.status;
    if (status.isGranted) {
      if (wantNavigated != null || wantNavigated == true) {
        context.navigateTo(const GempaBumiRouter());
      }
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    } else {
      showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        useRootNavigator: false,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Ups kami masih belum dapat izin lokasi kamu!',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Kasih izin dong buat akses lokasi mu, biar saat melaporkan masalah bisa kasih lokasi yang akurat',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.textFaded,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                CustomButton(
                  text: 'Oke, Izinkan',
                  onTap: () async {
                    await Permission.locationWhenInUse.request().then((value) {
                      if (value == PermissionStatus.granted) {
                        context.read<GeolocationBloc>().add(LoadGeolocation());
                        context.navigateTo(const GempaBumiRouter());
                      } else {
                        context.router.pop();
                      }
                    });
                  },
                )
              ],
            ),
          );
        },
      );
    }
  }
}
