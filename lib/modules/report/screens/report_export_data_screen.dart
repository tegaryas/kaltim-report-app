import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/report/blocs/report_export/report_export_bloc.dart';
import 'package:kaltim_report/modules/report/models/report_export_form_model.dart';
import 'package:kaltim_report/widgets/custom_button.dart';
import 'package:kaltim_report/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class ReportExportDataScreen extends StatefulWidget {
  const ReportExportDataScreen({Key? key}) : super(key: key);

  @override
  State<ReportExportDataScreen> createState() => _ReportExportDataScreenState();
}

class _ReportExportDataScreenState extends State<ReportExportDataScreen> {
  late ReportExportBloc reportExportBloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email;
  DateTime? startDate;
  DateTime? endDate;
  ReportExportFormat? exportFormat;
  ReportExportPeriod? exportPeriod;

  @override
  void initState() {
    reportExportBloc = getIt.get<ReportExportBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => reportExportBloc,
      child: BlocListener<ReportExportBloc, ReportExportState>(
        listener: (context, state) {
          if (state is ReportExportSuccess) {
            FlushbarHelper.createSuccess(
              message: 'Laporan tersimpan pada File Download',
              title: "Export Berhasil",
              duration: const Duration(seconds: 3),
            ).show(context);
          }

          if (state is ReportExportFailed) {
            FlushbarHelper.createError(
              message: "Gagal Melakukan Export Laporan",
              title: "Ups gagal",
              duration: const Duration(seconds: 2),
            ).show(context);
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Export Laporan Warga",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
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
                NormalTextField(
                  label: 'Alamat Email Tujuan',
                  hint: "Masukkan alamat email tujuan",
                  onSaved: (val) {
                    email = val;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                GhostDropdownTextField<ReportExportPeriod>(
                  label: 'Periode',
                  hint: "Pilih Periode Export",
                  validator: (value) =>
                      RequiredValidator(errorText: "Harap Masukkan periode")
                          .call(value?.toString() ?? ''),
                  items: const [
                    DropdownMenuItem(
                      value: ReportExportPeriod.last_2Week,
                      child: Text(
                        "2 Minggu Terakhir",
                      ),
                    ),
                    DropdownMenuItem(
                      value: ReportExportPeriod.lastMonth,
                      child: Text(
                        "1 Bulan Terakhir",
                      ),
                    ),
                  ],
                  onSaved: (val) {
                    exportPeriod = val;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                GhostDropdownTextField<ReportExportFormat>(
                  label: 'Format',
                  hint: "Pilih Format yang akan di Export",
                  validator: (value) =>
                      RequiredValidator(errorText: "Harap pilih format")
                          .call(value?.toString() ?? ''),
                  items: const [
                    DropdownMenuItem(
                      value: ReportExportFormat.excel,
                      child: Text(
                        "Excel (.xls)",
                      ),
                    ),
                    DropdownMenuItem(
                      value: ReportExportFormat.csv,
                      child: Text(
                        "CSV (.csv)",
                      ),
                    ),
                  ],
                  onSaved: (val) {
                    exportFormat = val;
                  },
                )
              ],
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(24),
            child: BlocBuilder<ReportExportBloc, ReportExportState>(
              bloc: reportExportBloc,
              builder: (context, state) {
                final isLoading = state is ReportExportLoading;
                return CustomButton(
                  text: 'Export',
                  isLoading: isLoading,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      reportExportBloc.add(ReportExportStart(
                        email: email,
                        period: exportPeriod!,
                        exportFormat: exportFormat!,
                        startDate: startDate,
                        endDate: endDate,
                      ));
                    }
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
