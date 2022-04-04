import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/utils/converter_helper.dart';
import 'package:kaltim_report/widgets/image_network_builder.dart';
import 'package:sizer/sizer.dart';

import 'components/status_report_badge.dart';

class DetailReportScreen extends StatefulWidget {
  const DetailReportScreen({
    Key? key,
    required this.report,
  }) : super(key: key);

  final ReportModel report;

  @override
  State<DetailReportScreen> createState() => _DetailReportScreenState();
}

class _DetailReportScreenState extends State<DetailReportScreen> {
  final Completer<GoogleMapController> _mapsController = Completer();
  LatLng? latLng;
  List markers = [];
  List circles = [];

  @override
  void initState() {
    latLng = LatLng(
        widget.report.location.latitude, widget.report.location.longitude);
    getMarkerandCircle();
    super.initState();
  }

  void getMarkerandCircle() {
    final googleMarker = Marker(
      markerId: const MarkerId('_reportLocationMark'),
      infoWindow: const InfoWindow(title: "Titik Permasalahan"),
      icon: BitmapDescriptor.defaultMarker,
      position: latLng!,
    );

    final Circle circle = Circle(
      circleId: const CircleId("_reportLocationCircle"),
      fillColor: Colors.lightBlue.withOpacity(0.1),
      strokeColor: Colors.lightBlue.withOpacity(0.5),
      strokeWidth: 1,
      center: latLng!,
      radius: 500,
    );

    setState(() {
      markers.add(googleMarker);
      circles.add(circle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Laporan',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: Platform.isIOS
            ? const BouncingScrollPhysics()
            : const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPictureSection(),
            SizedBox(
              height: 2.h,
            ),
            _buildDetailLaporanSection(context),
            _buildDivider(),
            _buildLocationSection(),
            _buildDivider(),
            if (widget.report.reportProgress != null)
              _buildStatusReportSection(context),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPictureSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ImageNetworkBuild(
          imageUrl: widget.report.imageUrl,
          height: 30.h,
          width: 100.w,
        ),
      ),
    );
  }

  Widget _buildStatusReportSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Status Laporan',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ConverterHelper.convertDateTimeToFullDateFormat(
                          widget.report.reportProgress!.last.date, context),
                      style: TextStyle(
                        fontSize: 9.sp,
                        color: AppColors.textFaded,
                      ),
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      widget.report.reportProgress!.last.statusProgress,
                      style: TextStyle(
                        fontSize: 10.sp,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              _statusTypeToWidget(
                  widget.report.reportProgress!.last.statusType),
            ],
          ),
          Divider(
            height: 4.h,
            color: Theme.of(context).dividerColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  context.pushRoute(ReportDetailProgressRoute(
                      progress:
                          widget.report.reportProgress!.reversed.toList()));
                },
                child: Text(
                  'Lihat Selengkapnya',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right,
                size: 20.sp,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDetailLaporanSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detail Laporan',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 0.5.h,
          ),
          Text(
            'Berisi semua detail informasi dari aduan yang telah dimasukkan oleh masyarakat',
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.textFaded,
              height: 1.5,
            ),
          ),
          SizedBox(
            height: 2.5.h,
          ),
          _buildDetailLaporan(
            title: "Nomor Laporan",
            value: widget.report.id,
            valueTextColor: Theme.of(context).colorScheme.secondary,
          ),
          SizedBox(
            height: 2.5.h,
          ),
          _buildDetailLaporan(
            title: "Permasalahan",
            value: widget.report.problem,
          ),
          SizedBox(
            height: 2.5.h,
          ),
          Row(
            children: [
              Expanded(
                child: _buildDetailLaporan(
                  title: "Tanggal Masuk",
                  value: ConverterHelper.convertDateTimeToFullDateFormat(
                      widget.report.dateInput, context),
                ),
              ),
              Expanded(
                child: _buildDetailLaporan(
                  title: "Kategori",
                  value: widget.report.category,
                ),
              ),
            ],
          ),
          if (widget.report.description != null)
            Column(
              children: [
                SizedBox(
                  height: 2.5.h,
                ),
                _buildDetailLaporan(
                  title: "Deskripsi Tambahan",
                  value: widget.report.description!,
                ),
              ],
            ),
          SizedBox(
            height: 0.5.h,
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lokasi',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.red,
                size: 15.sp,
              ),
              SizedBox(
                width: 2.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.report.address,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: _buildLocationMaps(),
          ),
          SizedBox(
            height: 0.5.h,
          ),
        ],
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      height: 6.h,
      thickness: 10,
    );
  }

  Widget _statusTypeToWidget(ReportStatusType status) {
    switch (status) {
      case ReportStatusType.menunggu:
        return const StatusReportBadge(
          status: 'Menunggu',
          backgroundColor: Colors.grey,
        );
      case ReportStatusType.proses:
        return const StatusReportBadge(
          status: 'Proses',
          backgroundColor: Colors.orange,
        );
      case ReportStatusType.selesai:
        return const StatusReportBadge(
          status: 'Selesai',
          backgroundColor: Colors.green,
        );
      case ReportStatusType.tindakLanjut:
        return const StatusReportBadge(
          status: 'Tindak Lanjut',
          backgroundColor: Colors.blue,
        );
      case ReportStatusType.validasi:
        return const StatusReportBadge(
          status: 'Valdasi',
          backgroundColor: Colors.amber,
        );
      default:
        return Container();
    }
  }

  Widget _buildLocationMaps() {
    return SizedBox(
      height: 35.h,
      width: 100.w,
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                widget.report.location.latitude,
                widget.report.location.longitude,
              ),
              zoom: 15,
            ),
            markers: Set.from(
              markers,
            ),
            circles: Set.from(
              circles,
            ),
            zoomGesturesEnabled: false,
            scrollGesturesEnabled: false,
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            onMapCreated: (controller) {
              _mapsController.complete(controller);
            },
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: () {
                context.pushRoute(ReportLocationRoute(latLng: latLng!));
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Icon(
                  Icons.zoom_out_map,
                  size: 15.sp,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailLaporan({
    required String title,
    required String value,
    Color? valueTextColor,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.textFaded,
          ),
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            height: 1.5,
            color: valueTextColor,
          ),
        ),
      ],
    );
  }
}
