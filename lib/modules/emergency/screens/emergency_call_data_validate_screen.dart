import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/constant/constant.dart';
import 'package:kaltim_report/modules/emergency/blocs/emergency_validate_phone_number/emergency_validate_phone_number_bloc.dart';

import 'package:kaltim_report/modules/profile/blocs/profile_edit/profile_edit_bloc.dart';
import 'package:kaltim_report/modules/profile/models/profile_form_model.dart';
import 'package:kaltim_report/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

class EmergencyCallDataValidateScreen extends StatefulWidget {
  const EmergencyCallDataValidateScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyCallDataValidateScreen> createState() =>
      _EmergencyCallDataValidateScreenState();
}

class _EmergencyCallDataValidateScreenState
    extends State<EmergencyCallDataValidateScreen> {
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
          BlocListener<EmergencyValidatePhoneNumberBloc,
              EmergencyValidatePhoneNumberState>(
            listener: (context, state) {
              if (state is EmergencyValidatePhoneNumberExist) {
                context.router.pushAndPopUntil(
                  const EmergencyCallRoute(),
                  predicate: (route) => false,
                );
              }
            },
          ),
          BlocListener<ProfileEditBloc, ProfileEditState>(
            listener: (context, state) {
              if (state is ProfileEditLoaded) {
                context.pushRoute(const EmergencyCallRoute());
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
        child: Scaffold(
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
                        errorText: "Masukkan minimal 10 karakter")
                  ]),
                  onSaved: (val) {
                    phoneNumber = val;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
