import 'dart:io';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/report/blocs/report_update_form/report_update_form_bloc.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

class ReportAddProgressAdminScreen extends StatefulWidget {
  final String id;
  const ReportAddProgressAdminScreen({Key? key, required this.id})
      : super(key: key);

  @override
  State<ReportAddProgressAdminScreen> createState() =>
      _ReportAddProgressAdminScreenState();
}

class _ReportAddProgressAdminScreenState
    extends State<ReportAddProgressAdminScreen> {
  late ReportUpdateFormBloc reportUpdateFormBloc;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ImagePicker _imagePicker = ImagePicker();

  String? description;
  XFile? _selectedImage;
  ReportStatusType? statusType;
  String? statusProgress;

  @override
  void initState() {
    reportUpdateFormBloc = getIt.get<ReportUpdateFormBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => reportUpdateFormBloc,
      child: BlocListener<ReportUpdateFormBloc, ReportUpdateFormState>(
        listener: (context, state) {
          if (state is ReportUpdateFormSuccess) {
            FlushbarHelper.createSuccess(
              message: 'Update Status laporan telah berhasil',
              title: "Sukses",
              duration: const Duration(seconds: 2),
            ).show(context).whenComplete(() => context.popRoute(true));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Tambah Status Laporan',
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
            child: BlocBuilder<ReportUpdateFormBloc, ReportUpdateFormState>(
              builder: (context, state) {
                final isLoading = state is ReportUpdateFormLoading;
                return CustomButton(
                  text: 'Update Progress',
                  isLoading: isLoading,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      context.read<ReportUpdateFormBloc>().add(
                            ReportUpdateFormAdd(
                              data: ReportProgressModel(
                                statusType: statusType!,
                                date: DateTime.now(),
                                description: description,
                                statusProgress:
                                    _statusTypeToStatusProgress(statusType!),
                              ),
                              id: widget.id,
                              imageFile: _selectedImage,
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
            child: ListView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              children: [
                Text(
                  "Gambar Status Laporan",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                              height: 30.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(File(_selectedImage!.path)),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
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
                const SizedBox(
                  height: 30,
                ),
                GhostDropdownTextField<ReportStatusType>(
                  label: "Pilih Status",
                  hint: "Masukkan status yang ini ditambahkan",
                  validator: (value) => RequiredValidator(
                          errorText: "Harap Masukkan status laporan")
                      .call(value?.toString() ?? ''),
                  items: const [
                    DropdownMenuItem(
                      value: ReportStatusType.proses,
                      child: Text(
                        "Proses",
                      ),
                    ),
                    DropdownMenuItem(
                      value: ReportStatusType.selesai,
                      child: Text(
                        "Selesai",
                      ),
                    ),
                    DropdownMenuItem(
                      value: ReportStatusType.tindakLanjut,
                      child: Text(
                        'Tidak Lanjut',
                      ),
                    ),
                    DropdownMenuItem(
                      value: ReportStatusType.tidakValid,
                      child: Text(
                        "Tidak Valid",
                      ),
                    ),
                  ],
                  onSaved: (val) {
                    statusType = val;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                ParagraphTextField(
                  label: 'Keterangan Progress',
                  hint: "Masukkan Keterangan progress laporan terbaru",
                  keyboardType: TextInputType.multiline,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Harap Masukkan Keteranganmu"),
                    MinLengthValidator(10,
                        errorText: "Masukkan minimal 10 karakter")
                  ]),
                  onSaved: (val) {
                    description = val;
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _statusTypeToStatusProgress(ReportStatusType status) {
    switch (status) {
      case ReportStatusType.menunggu:
        return 'Menunggu';
      case ReportStatusType.proses:
        return 'Laporan sedang dikerjakan oleh petugas Desa Singa Gembara';
      case ReportStatusType.selesai:
        return 'Laporan dinyatakan selesai oleh Desa Singa Gembara';
      case ReportStatusType.tindakLanjut:
        return 'Laporan ditandaklanjuti oleh petugas Desa Singa Gembara';
      case ReportStatusType.validasi:
        return 'Tindak lanjut laporan sedanga divaldasi oleh Desa Singa Gembara';
      case ReportStatusType.tidakValid:
        return 'Laporan ditolak oleh Desa Singa Gembara';
      default:
        return "";
    }
  }
}
