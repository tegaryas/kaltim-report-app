import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/profile/blocs/profile_edit/profile_edit_bloc.dart';
import 'package:kaltim_report/modules/profile/models/profile_form_model.dart';
import 'package:kaltim_report/modules/profile/models/profile_model.dart';
import 'package:kaltim_report/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key, required this.profile}) : super(key: key);

  final ProfileModel profile;

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? name;
  String? email;
  String? phoneNumber;
  String? address;
  @override
  void initState() {
    super.initState();
    name = widget.profile.name;
    email = widget.profile.email;
    phoneNumber = widget.profile.phoneNumber;
    address = widget.profile.address;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileEditBloc>(
      create: (context) => getIt.get<ProfileEditBloc>(),
      child: BlocConsumer<ProfileEditBloc, ProfileEditState>(
        listener: (context, state) {
          if (state is ProfileEditLoaded) {
            FlushbarHelper.createSuccess(
              message: 'Update Profile telah berhasil',
              title: "Sukses",
              duration: const Duration(seconds: 2),
            ).show(context).whenComplete(() => context.popRoute());
          }

          if (state is ProfileEditFailed) {
            FlushbarHelper.createError(
              message: "Gagal melakukan update data profile mu",
              title: "Ups Gagal",
              duration: const Duration(seconds: 2),
            ).show(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  context.popRoute();
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 18.sp,
                ),
              ),
              title: Text(
                'Edit Data Akun',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      context.read<ProfileEditBloc>().add(
                            ProfileUpdateFormData(
                              data: ProfileFormModel(
                                name: name!,
                                phoneNumber: phoneNumber,
                                address: address,
                              ),
                            ),
                          );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: Text(
                        'Simpan',
                        style: TextStyle(
                          fontSize: 9.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    NormalTextField(
                      label: 'Alamat Email',
                      initialValue: email,
                      enabled: false,
                      onChanged: (val) {
                        email = val;
                      },
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    NormalTextField(
                      label: 'Nama Lengkap',
                      hint: "Masukkan Nama Lengkap Anda",
                      initialValue: name,
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: "Harap Masukkan Nama Lengkap mu"),
                        MinLengthValidator(2,
                            errorText: "Masukkan minimal 2 karakter")
                      ]),
                      onChanged: (val) {
                        name = val;
                      },
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    NormalTextField(
                      label: 'Nomor Handphone',
                      hint: "Masukkan Nomor Handphone Anda",
                      initialValue: phoneNumber,
                      keyboardType: TextInputType.phone,
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: "Harap Masukkan Nomor Handphone mu"),
                        MinLengthValidator(10,
                            errorText: "Masukkan minimal 10 karakter")
                      ]),
                      onChanged: (val) {
                        phoneNumber = val;
                      },
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    NormalTextField(
                      label: 'Alamat Lengkap',
                      hint: "Masukkan Alamat Anda",
                      initialValue: address,
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: "Harap Masukkan Alamat mu"),
                        MinLengthValidator(10,
                            errorText: "Masukkan minimal 10 karakter")
                      ]),
                      onChanged: (val) {
                        address = val;
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
