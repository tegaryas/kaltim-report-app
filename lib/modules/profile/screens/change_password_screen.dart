import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sizer/sizer.dart';

import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/profile/blocs/update_password/update_password_bloc.dart';
import 'package:kaltim_report/widgets/custom_button.dart';
import 'package:kaltim_report/widgets/custom_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? newPassword;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdatePasswordBloc>(
      create: (context) => getIt.get<UpdatePasswordBloc>(),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<UpdatePasswordBloc, UpdatePasswordState>(
          listener: (context, state) {
            if (state is UpdatePasswordSuccess) {
              context.popRoute();
            }

            if (state is UpdatePasswordFailed) {
              FlushbarHelper.createError(
                message: state.e,
                title: "Gagal",
                duration: const Duration(seconds: 2),
              ).show(context);
            }
          },
          builder: (context, state) {
            final isLoading = state is UpdatePasswordLoading;
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ubah Kata Sandi Anda',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Buat kata sandi yang kuat untuk akun Anda',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    PasswordTextField(
                      label: 'Kata Sandi Baru',
                      hint: 'Masukkan Kata Sandi Baru Anda',
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: "Harap Masukkan Kata Sandi Baru Anda"),
                        MinLengthValidator(6,
                            errorText: "Masukkan minimal 6 karakter")
                      ]),
                      onChanged: (val) {
                        newPassword = val;
                      },
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    PasswordTextField(
                      label: 'Ketik Ulang Kata Sandi Baru',
                      hint: 'Masukkan Kata Sandi Baru Anda',
                      validator: (val) {
                        return MatchValidator(
                                errorText: "Kata Sandi Tidak Cocok ")
                            .validateMatch(val!, newPassword ?? "");
                      },
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    CustomButton(
                      text: 'Lanjutkan',
                      isLoading: isLoading,
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          context
                              .read<UpdatePasswordBloc>()
                              .add(UpdatePasswordUser(newPassword!));
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
