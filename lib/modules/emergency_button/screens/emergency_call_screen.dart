import 'dart:async';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/constant/constant.dart';
import 'package:kaltim_report/core/notification/blocs/notification_send/notification_send_bloc.dart';
import 'package:kaltim_report/modules/emergency_button/blocs/emergency_call/emergency_call_bloc.dart';
import 'package:kaltim_report/modules/emergency_button/blocs/emergency_validate_phone_number/emergency_validate_phone_number_bloc.dart';
import 'package:kaltim_report/modules/emergency_button/models/emergency_call_form_model.dart';
import 'package:kaltim_report/modules/profile/blocs/profile_edit/profile_edit_bloc.dart';
import 'package:kaltim_report/modules/profile/models/profile_form_model.dart';
import 'package:kaltim_report/modules/report/blocs/geolocation/geolocation_bloc.dart';
import 'package:kaltim_report/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

class EmergencyCallScreen extends StatefulWidget {
  const EmergencyCallScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyCallScreen> createState() => _EmergencyCallScreenState();
}

class _EmergencyCallScreenState extends State<EmergencyCallScreen> {
  late ProfileEditBloc editProfileBloc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? phoneNumber;

  @override
  void initState() {
    editProfileBloc = getIt.get<ProfileEditBloc>();
    super.initState();
  }

  @override
  void dispose() {
    editProfileBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileEditBloc>(
      create: (context) => editProfileBloc,
      child: MultiBlocListener(
        listeners: [
          BlocListener<EmergencyCallBloc, EmergencyCallState>(
            listener: (context, state) {
              if (state is EmergencyCallSuccess) {
                context.router.root.popUntilRoot();
                context.pushRoute(const EmergencyCallRouter(
                    children: [EmergencyCallSuccessRoute()]));
              }
            },
          ),
          BlocListener<NotificationSendBloc, NotificationSendState>(
            listener: (context, state) {
              //TRIGER SEND NOTIF
            },
          ),
          BlocListener<ProfileEditBloc, ProfileEditState>(
            listener: (context, state) {
              if (state is ProfileEditLoaded) {
                context
                    .read<EmergencyValidatePhoneNumberBloc>()
                    .add(EmergencyValidatePhoneNumberCheck());
              }
              if (state is ProfileEditFailed) {
                FlushbarHelper.createError(
                  message: "Gagal melakukan update nnomor handphonemu",
                  title: "Ups Gagal",
                  duration: const Duration(seconds: 2),
                ).show(context);
              }
            },
          ),
        ],
        child: BlocBuilder<EmergencyValidatePhoneNumberBloc,
            EmergencyValidatePhoneNumberState>(
          builder: (context, state) {
            if (state is EmergencyValidatePhoneNumberExist) {
              return _buildPhonenumberExist(context);
            } else if (state is EmergencyValidatePhoneNumberNotExist) {
              return _buildPhonenumberNotExist();
            } else if (state is EmergencyValidatePhoneNumberFailed) {
              return _buildWidgetFailed(context);
            } else {
              return _buildWidgetLoading();
            }
          },
        ),
      ),
    );
  }

  Widget _buildWidgetLoading() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Panggilan Darurat',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildWidgetFailed(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Panggilan Darurat',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ErrorPlaceholder(
        title: 'Ups Terjadi Kesalahan',
        subtitle:
            'Jangan panik, kamu bisa memuat ulang data dengan menekan tombol dibawah ini!',
        onTap: () {
          context
              .read<EmergencyValidatePhoneNumberBloc>()
              .add(EmergencyValidatePhoneNumberCheck());
        },
      ),
    );
  }

  Widget _buildPhonenumberNotExist() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Panggilan Darurat',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        child: BlocBuilder<ProfileEditBloc, ProfileEditState>(
          builder: (context, state) {
            final isLoading = state is ProfileEditLoading;
            return CustomButton(
              text: 'Tetapkan No. HP',
              isLoading: isLoading,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();

                  editProfileBloc.add(
                    ProfileUpdateFormData(
                      data: ProfileFormModel(
                        phoneNumber: phoneNumber,
                      ),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          children: [
            Image.asset(
              Assets.images.onboardingSlide1.path,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Mohon Masukkan No.HP',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Tim Cepat Tanggap Desa Singa Gembara akan menghubungi kamu. Pastikan No. HP kamu aktif, ya',
              style: TextStyle(
                fontSize: 9.sp,
                fontWeight: FontWeight.w400,
                height: 1.5,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            NormalTextField(
              label: 'Nomor Telpon',
              hint: "Masukkan Nomor Telpon",
              initialValue: phoneNumber,
              keyboardType: TextInputType.phone,
              validator: MultiValidator([
                RequiredValidator(errorText: "Data harus diisi"),
                MinLengthValidator(10,
                    errorText: "Masukkan minimal 10 karakter"),
                MaxLengthValidator(13, errorText: "Maximal 13 karakter")
              ]),
              onSaved: (val) {
                phoneNumber = val;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhonenumberExist(BuildContext context) {
    return Scaffold(
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
                      return HoverButtonEmergency(
                        isLoading: isLoading,
                        position: state.position,
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
    );
  }
}

class HoverButtonEmergency extends StatelessWidget {
  const HoverButtonEmergency({
    Key? key,
    required this.isLoading,
    required this.position,
  }) : super(key: key);

  final bool isLoading;
  final Position position;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: isLoading
          ? () {}
          : () {
              Timer(const Duration(seconds: 3), () {
                context
                    .read<NotificationSendBloc>()
                    .add(NotificationSendStarted());

                context.read<EmergencyCallBloc>().add(
                      EmergencyCallSendForm(
                        data: EmergencyCallFormModel(
                          location: GeoPoint(
                            position.latitude,
                            position.longitude,
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
  }
}
