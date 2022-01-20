import 'dart:io';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/report/blocs/geolocation/geolocation_bloc.dart';
import 'package:kaltim_report/modules/report/blocs/report_form/report_form_bloc.dart';
import 'package:kaltim_report/modules/report/models/report_form_model.dart';
import 'package:kaltim_report/utils/generate_uid.dart';
import 'package:sizer/sizer.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:kaltim_report/widgets/custom_button.dart';
import 'package:kaltim_report/widgets/custom_info_container.dart';
import 'package:kaltim_report/widgets/custom_text_field.dart';

class AddReportScreen extends StatefulWidget {
  const AddReportScreen({
    Key? key,
    this.reportTitle,
  }) : super(key: key);

  final String? reportTitle;

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  final ImagePicker _imagePicker = ImagePicker();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  XFile? _selectedImage;
  String? permasalahText;
  String? lokasiText;
  String? tambahanText;

  @override
  void initState() {
    requestLocationPermission();
    super.initState();
  }

  /*Checking if your App has been Given Permission*/
  Future<void> requestLocationPermission() async {
    final isLocationEnable = await Permission.locationWhenInUse.status;

    if (!isLocationEnable.isGranted) {
      await Permission.locationWhenInUse.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReportFormBloc>(
          create: (context) => getIt.get<ReportFormBloc>(),
        ),
        BlocProvider<GeolocationBloc>(
          create: (context) =>
              getIt.get<GeolocationBloc>()..add(LoadGeolocation()),
        ),
      ],
      child: BlocListener<ReportFormBloc, ReportFormState>(
        listener: (context, state) {
          if (state is ReportFormAddedSucess) {
            FlushbarHelper.createSuccess(
              message: 'Berhasil Menambahkan Laporan',
              title: 'Sukses',
              duration: const Duration(seconds: 2),
            ).show(context).then((value) => context.popRoute());
          }
          //TODO: Add Error Modal
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              widget.reportTitle != null
                  ? 'Tambah ${widget.reportTitle}'
                  : 'Tambah Laporan',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: BlocBuilder<ReportFormBloc, ReportFormState>(
              builder: (context, state) {
                final isLoading = state is ReportFormLoading;
                return BlocBuilder<GeolocationBloc, GeolocationState>(
                  builder: (context, state) {
                    if (state is GeolocationLoaded) {
                      return CustomButton(
                        text: 'Simpan Laporan',
                        isLoading: isLoading,
                        onTap: () {
                          if (_formKey.currentState!.validate() &&
                              _selectedImage != null) {
                            _formKey.currentState!.save();

                            context.read<ReportFormBloc>().add(
                                  ReportFormAdd(
                                    form: ReportFormModel(
                                      id: GenerateUID.generateVeryUniqueID(),
                                      imageUrl: "",
                                      location: GeoPoint(
                                          state.position.latitude,
                                          state.position.longitude),
                                      problem: permasalahText!,
                                      dateInput: DateTime.now(),
                                      address: lokasiText!,
                                      category: "Bebas",
                                      description: tambahanText,
                                    ),
                                    imageFile: _selectedImage!,
                                  ),
                                );
                          }
                        },
                      );
                    } else {
                      return CustomButton(
                        text: 'Simpan Laporan',
                        onTap: () {},
                      );
                    }
                  },
                );
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 1.h,
                  ),
                  _buildTextTitle("Gambar Laporan"),
                  SizedBox(
                    height: 1.h,
                  ),
                  GestureDetector(
                    onTap: () async {
                      XFile? image = await _imagePicker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: 60,
                      );

                      if (image != null) {
                        setState(() {
                          _selectedImage = image;
                        });
                      }
                    },
                    child: _selectedImage != null
                        ? Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            height: 30.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(File(_selectedImage!.path)),
                              ),
                            ),
                          )
                        : Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            height: 30.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 20.sp,
                            ),
                          ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  _buildTextTitle("Ceritakan Detail Laporan kamu"),
                  SizedBox(
                    height: 1.h,
                  ),
                  const CustomInfoContainer(
                    title: "Ceritakan Laporan Mu",
                    desc:
                        "Detail permasalahan dapat memuat info berupa waktu kejadian, jenis pelanggaran, dan lainnya",
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  _buildTextTitle("Permasalahan :"),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: ParagraphTextField(
                      keyboardType: TextInputType.multiline,
                      textFieldHeight: 12.h,
                      hint:
                          "Contoh: Sebuah pohon menutupi jalan dikarenakan roboh\ndan butuh untuk di bersihkan dengan cepat",
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: "Harap Masukkan Permasalahan Dahulu Ya"),
                        MinLengthValidator(50,
                            errorText: "Minimal 50 karakter"),
                      ]),
                      onChanged: (val) {
                        permasalahText = val;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  _buildTextTitle("Tuliskan Lokasi Secara Lengkap"),
                  SizedBox(
                    height: 1.h,
                  ),
                  const CustomInfoContainer(
                    title: "Tulis lokasi",
                    desc:
                        "Lokasi dapat memuat info berupa nama jalan, nama gedung, ciri khusus di sekitar, dan lainnya",
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  _buildTextTitle("Lokasi :"),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: ParagraphTextField(
                      keyboardType: TextInputType.multiline,
                      textFieldHeight: 12.h,
                      hint:
                          "Contoh: Jalan Soekarno - Hatta Gg. Manunggal\nRt. 26, Desa Singa Gembara",
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: "Harap Masukkan Alamat Dahulu Ya"),
                        MinLengthValidator(30,
                            errorText: "Minimal 30 karakter"),
                      ]),
                      onChanged: (val) {
                        lokasiText = val;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  _buildTextTitle("Informasi Tambahan"),
                  SizedBox(
                    height: 1.h,
                  ),
                  const CustomInfoContainer(
                    title: "Informasi Tambahan",
                    desc:
                        "Informasi tambahan dapat berupa hal yang perlu petugas tau lebih lanjut",
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  _buildTextTitle("Tambahan :"),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: ParagraphTextField(
                      keyboardType: TextInputType.multiline,
                      textFieldHeight: 12.h,
                      hint:
                          "Contoh: Mohon petugas agar berhati dalam melakukan\npembersihandikarenakan disekitar pohon banyak\ntiang listrik.",
                      onChanged: (val) {
                        tambahanText = val;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildTextTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  _buildHintText(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 9.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
