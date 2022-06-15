import 'package:flutter/material.dart';
import 'package:kaltim_report/widgets/custom_text_field.dart';
import 'package:sizer/sizer.dart';

class ReportExportDataScreen extends StatefulWidget {
  const ReportExportDataScreen({Key? key}) : super(key: key);

  @override
  State<ReportExportDataScreen> createState() => _ReportExportDataScreenState();
}

class _ReportExportDataScreenState extends State<ReportExportDataScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? email;
  DateTime? startDate;
  DateTime? endDate;
  String? exportFormat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            ),
            const SizedBox(
              height: 30,
            ),
            GhostDropdownTextField(
              label: 'Periode',
              hint: "Pilih Periode Export",
            ),
            const SizedBox(
              height: 30,
            ),
            GhostDropdownTextField<String>(
              label: 'Format',
              hint: "Pilih Format yang akan di Export",
              onSaved: (val) {
                exportFormat = val;
              },
            )
          ],
        ),
      ),
    );
  }
}
