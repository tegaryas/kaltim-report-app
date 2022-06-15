import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/modules/emergency/blocs/emergency_call/emergency_call_bloc.dart';
import 'package:kaltim_report/modules/emergency/models/emergency_call_form_model.dart';
import 'package:kaltim_report/modules/report/blocs/geolocation/geolocation_bloc.dart';
import 'package:kaltim_report/widgets/custom_info_container.dart';
import 'package:sizer/sizer.dart';

class EmergencyCallScreen extends StatelessWidget {
  const EmergencyCallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmergencyCallBloc, EmergencyCallState>(
      listener: (context, state) {
        if (state is EmergencyCallSuccess) {
          context.router.root.popUntilRoot();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Panggilan Darurat',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              context.popRoute();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 18.sp,
            ),
          ),
        ),
        body: Container(
          height: 100.h,
          width: 100.w,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tap Untuk memanggil bantuan',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'tekan selama 3 detik untuk panggilan darurat',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              BlocBuilder<EmergencyCallBloc, EmergencyCallState>(
                builder: (context, state) {
                  final isLoading = state is EmergencyCallLoading;
                  return BlocBuilder<GeolocationBloc, GeolocationState>(
                    builder: (context, state) {
                      if (state is GeolocationLoaded) {
                        return InkWell(
                          onLongPress: isLoading
                              ? () {}
                              : () {
                                  Timer(const Duration(seconds: 3), () {
                                    context.read<EmergencyCallBloc>().add(
                                          EmergencyCallSendForm(
                                            data: EmergencyCallFormModel(
                                              location: GeoPoint(
                                                state.position.latitude,
                                                state.position.longitude,
                                              ),
                                              dateInput: DateTime.now(),
                                            ),
                                          ),
                                        );
                                  });
                                },
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 18.h,
                            width: 18.h,
                            margin: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1, 1),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.call,
                              color: Colors.white,
                              size: 30.sp,
                            ),
                          ),
                        );
                      } else {
                        return InkWell(
                          onLongPress: () {},
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 18.h,
                            width: 18.h,
                            margin: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(1, 1),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.call,
                              color: Colors.white,
                              size: 30.sp,
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
              SizedBox(
                height: 8.h,
              ),
              const CustomInfoContainer(
                title: 'Gunakan Tombol dengan Bijak',
                desc:
                    'Diharapkan bagi pengguna untuk menekan tombol tersebut apabila dibutuhkan',
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                'Didukung oleh:',
                style: TextStyle(
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Layanan Panggilan Darurat Sangatta (112)',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
