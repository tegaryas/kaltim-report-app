import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/auth/blocs/login/login_bloc.dart';
import 'package:kaltim_report/modules/auth/blocs/register/register_bloc.dart';
import 'package:kaltim_report/widgets/custom_button.dart';
import 'package:kaltim_report/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email;

  String? password;
  String? passwordConfirm;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterBloc>(
            create: (context) => getIt.get<RegisterBloc>())
      ],
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterAlreadyRegistered) {
            context.router.replaceAll([const LoginRoute()]);
          } else if (state is RegisterUser) {
            context.router.push(RegisterUserDataRoute(email: state.email));
          }
        },
        child: BlocBuilder<RegisterBloc, RegisterState>(
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
                        "Selamat Datang",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        "Silahkan registerasi untuk mengakses aplikasi",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      NormalTextField(
                        label: 'Email',
                        hint: "Masukkan Email",
                        validator: MultiValidator([
                          RequiredValidator(
                              errorText: "Harap Masukkan Email mu"),
                          EmailValidator(errorText: "Email tidak valid")
                        ]),
                        onSaved: (val) {
                          email = val;
                        },
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomButton(
                        text: 'Daftar',
                        isLoading: isLoading,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context.read<RegisterBloc>().add(RegisterStarted(
                                  email: email!,
                                ));
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
                                      color: Colors.blueGrey,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10.sp,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        //TODO: Add Register Screen
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
