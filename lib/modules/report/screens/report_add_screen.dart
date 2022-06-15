import 'dart:io';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/report/blocs/geolocation/geolocation_bloc.dart';
import 'package:kaltim_report/modules/report/blocs/report_form/report_form_bloc.dart';
import 'package:kaltim_report/modules/report/models/report_category_model.dart';
import 'package:kaltim_report/modules/report/models/report_form_model.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/modules/report/screens/report_category_picker_screen.dart';
import 'package:kaltim_report/utils/generate_uid.dart';
import 'package:sizer/sizer.dart';

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
  ReportCategoryModel? _categoryModel;
  String? permasalahText;
  String? lokasiText;
  String? tambahanText;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReportFormBloc>(
          create: (context) => getIt.get<ReportFormBloc>(),
        ),
      ],
      child: BlocListener<ReportFormBloc, ReportFormState>(
        listener: (context, state) {
          if (state is ReportFormAddedSucess) {
            FlushbarHelper.createSuccess(
              message: 'Berhasil Menambahkan Laporan',
              title: 'Sukses',
              duration: const Duration(seconds: 2),
            ).show(context).whenComplete(() {
              context.popRoute();
              context.navigateTo(
                  ReportRouter(children: [DetailReportRoute(id: state.id)]));
            });
          } else if (state is ReportFormFailure) {
            FlushbarHelper.createError(
              message: '${state.error}',
              title: 'Yah Gagal',
              duration: const Duration(seconds: 2),
            ).show(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              widget.reportTitle != null
                  ? 'Tambah ${widget.reportTitle}'
                  : 'Tambah Laporan',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          bottomNavigationBar: _buildBottomNavBar(),
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
                        source: ImageSource.camera,
                        imageQuality: 60,
                      );

                      if (image != null) {
                        setState(() {
                          _selectedImage = image;
                        });
                      }
                    },
                    child: _selectedImage != null
                        ? Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                height: 30.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        FileImage(File(_selectedImage!.path)),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 30,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedImage = null;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                  _buildTextTitle("Pilih Kategori Laporan"),
                  SizedBox(
                    height: 1.h,
                  ),
                  const CustomInfoContainer(
                    title: "kategori Laporan",
                    desc:
                        "kategori Laporan adalah cara kami untuk mengkategorikan laporan dengan mudah, sehingga petugas kami cepat mengidentifikasi masalahnya",
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  _buildTextTitle("Kategori :"),
                  SizedBox(
                    height: 1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: GhostPickerField<ReportCategoryModel>(
                      initialValue: _categoryModel != null
                          ? GhostPickerFieldValue(
                              name: _categoryModel!.name, val: _categoryModel)
                          : null,
                      validator: (val) {
                        final valid = RequiredValidator(
                                errorText: "kategori laporan harus diisi")
                            .call(val?.name ?? "");
                        if (valid != null) {
                          return GhostPickerFieldValue(name: valid);
                        } else {
                          return null;
                        }
                      },
                      hint: 'Pilih Kategori Laporan',
                      onSaved: (val) => _categoryModel = val?.val,
                      suffixIcon: Icons.arrow_drop_down,
                      onTap: (val) async {
                        final selected = await context.router
                            .pushWidget<ReportCategoryModel?>(
                                ReportCategoryPickerScreen(
                          initialValue: val?.val?.id,
                        ));

                        if (selected != null) {
                          return GhostPickerFieldValue(
                              name: selected.name, val: selected);
                        }

                        return null;
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
                          "Contoh: Mohon petugas agar berhati dalam melakukan\npembersihan dikarenakan disekitar pohon banyak\ntiang listrik.",
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

  Widget _buildBottomNavBar() {
    return Container(
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
                                location: GeoPoint(
                                  state.position.latitude,
                                  state.position.longitude,
                                ),
                                problem: permasalahText!,
                                dateInput: DateTime.now(),
                                address: lokasiText!,
                                category: ReportCategoryModel(
                                  id: _categoryModel!.id,
                                  name: _categoryModel!.name,
                                  imageUrl: _categoryModel!.imageUrl,
                                ),
                                description: tambahanText,
                                lastStatus: ReportStatusType.menunggu,
                                reportProgress: [
                                  ReportProgressModel(
                                    statusType: ReportStatusType.menunggu,
                                    date: DateTime.now(),
                                    statusProgress:
                                        'Laporan Diterima oleh Desa Singa Gembara',
                                  ),
                                ],
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
                  onTap: () {
                    if (_formKey.currentState!.validate() &&
                        _selectedImage != null) {
                      _formKey.currentState!.save();
                    }
                  },
                );
              }
            },
          );
        },
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
}
