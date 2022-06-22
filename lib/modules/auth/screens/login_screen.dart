import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kaltim_report/modules/auth/blocs/login/login_bloc.dart';
import 'package:kaltim_report/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/core/auth/bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => getIt.get<LoginBloc>())
      ],
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.read<AuthBloc>().add(AuthStarted());
          }
          if (state is LoginFailed) {
            FlushbarHelper.createError(
              message: state.error.toString(),
              title: "Ups gagal",
              duration: const Duration(seconds: 2),
            ).show(context);
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final bool isLoading = state is LoginLoading;
            return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Hello,",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E9E9C),
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        "Silakan Login",
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        "Yuk masuk untuk dapat mengakses aplikasi",
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      NormalTextField(
                        label: 'Email',
                        hint: "Masukkan Email",
                        keyboardType: TextInputType.emailAddress,
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: "Harap Masukkan Emailmu"),
                          EmailValidator(errorText: "Email tidak valid")
                        ]),
                        onSaved: (val) {
                          email = val;
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      PasswordTextField(
                        label: 'Password',
                        hint: "Masukkan Password",
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: "Harap Masukkan Passwordmu"),
                        ]),
                        onSaved: (val) {
                          password = val;
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.router.push(const ResetPasswordRoute());
                            },
                            child: Text(
                              "Lupa Password",
                              style: TextStyle(
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomButton(
                        text: 'Login',
                        isLoading: isLoading,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context.read<LoginBloc>().add(
                                LoginStart(email: email!, password: password!));
                          }
                        },
                      ),
                      SizedBox(
                        height: 8.h,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 40.w,
                                child: const Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Atau",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                ),
                              ),
                              SizedBox(
                                width: 40.w,
                                child: const Divider(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SocialCustomButton(
                        text: 'Login dengan Google',
                        imageUrl: "assets/sosial/google.png",
                        type: CustomButtonType.outline,
                        isLoading: isLoading,
                        onTap: () {
                          context.read<LoginBloc>().add(LoginStartWithGoogle());
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                                text: "Belum Punya Akun? ",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Buat Akun",
                                    style: TextStyle(
                                      color: const Color(0xFF1E9E9C),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.sp,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        context.router
                                            .push(const RegisterRoute());
                                      },
                                  ),
                                ]),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
