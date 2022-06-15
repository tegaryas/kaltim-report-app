import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/auth/blocs/register/register_bloc.dart';
import 'package:kaltim_report/modules/auth/models/register_model.dart';
import 'package:kaltim_report/widgets/custom_button.dart';
import 'package:kaltim_report/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class RegisterUserDataScreen extends StatefulWidget {
  const RegisterUserDataScreen({Key? key, required this.email})
      : super(key: key);

  final String email;

  @override
  State<RegisterUserDataScreen> createState() => _RegisterUserDataScreenState();
}

class _RegisterUserDataScreenState extends State<RegisterUserDataScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? userName;
  String? password;
  String? passwordConfirm;
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(
            create: (context) => getIt.get<RegisterBloc>())
      ],
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            context.router.replaceAll([const LoginRoute()]);
          }
          if (state is RegisterFailed) {
            FlushbarHelper.createError(
              message: state.error.toString(),
              title: "Ups Gagal Daftar",
              duration: const Duration(seconds: 2),
            ).show(context);
          }
        },
        builder: (context, state) {
          final isLoadingRegister = state is RegisterLoading;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 60.0,
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Masukkan data untuk mendaftar",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      NormalTextField(
                        readOnly: isLoadingRegister,
                        label: 'Nama Lengkap',
                        hint: "Masukkan Nama Lengkap",
                        validator: RequiredValidator(
                            errorText: "Harap Masukkan Nama Lengkapmu"),
                        onSaved: (val) {
                          userName = val;
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      NormalTextField(
                        label: 'Email',
                        hint: "Masukkan Email",
                        initialValue: widget.email,
                        enabled: false,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      NormalTextField(
                        readOnly: isLoadingRegister,
                        label: 'Nomor Telpon',
                        hint: "Masukkan Nomor Telpon",
                        keyboardType: TextInputType.phone,
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: "Masukkan Nomor Telpon mu"),
                          MinLengthValidator(10,
                              errorText: "Masukkan minimal 10 karakter")
                        ]),
                        onSaved: (val) {
                          phoneNumber = val;
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      PasswordTextField(
                        readOnly: isLoadingRegister,
                        label: 'Password',
                        hint: "Masukkan Password",
                        keyboardType: TextInputType.visiblePassword,
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: "Harap Masukkan Password mu"),
                          MinLengthValidator(8,
                              errorText: "Masukkan minimal 8 karakter")
                        ]),
                        onChanged: (val) {
                          password = val;
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      PasswordTextField(
                          readOnly: isLoadingRegister,
                          label: 'Konfirmasi Password',
                          hint: "Masukkan Konfirmasi Password",
                          keyboardType: TextInputType.visiblePassword,
                          validator: (val) {
                            return MatchValidator(
                                    errorText: "Masukkan password yang sama")
                                .validateMatch(val!, password ?? "");
                          }),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              child: CustomButton(
                text: 'Daftar',
                isLoading: isLoadingRegister,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    context.read<RegisterBloc>().add(RegisterCompleteData(
                            data: RegisterModel(
                          name: userName!,
                          email: widget.email,
                          username: userName!,
                          password: password!,
                          phoneNumber: phoneNumber,
                        )));
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
