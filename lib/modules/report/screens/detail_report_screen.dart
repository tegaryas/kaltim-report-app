import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/home/models/report_model.dart';
import 'package:kaltim_report/utils/converter_helper.dart';
import 'package:kaltim_report/widgets/image_network_builder.dart';
import 'package:sizer/sizer.dart';

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
            color: Colors.black,
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
            ImageNetworkBuild(
              imageUrl: widget.report.imageUrl,
              height: 30.h,
              width: 100.w,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.5.h,
                  ),
                  Text(
                    'Permasalahan',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    widget.report.problem,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'Lokasi',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
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
                      Text(
                        widget.report.address,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            _buildDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detail Laporan',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  _buildDetailLaporan(
                    title: "Nomor Laporan",
                    value: widget.report.id,
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  _buildDetailLaporan(
                    title: "Tanggal Masuk",
                    value: ConverterHelper.convertDateTimeToDateFormat(
                        widget.report.dateInput, context),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  _buildDetailLaporan(
                    title: "Kategori",
                    value: widget.report.category,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                ],
              ),
            ),
            _buildDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                'Lokasi',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: _buildLocationMaps(),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                'Status Laporan',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }

  Divider _buildDivider() {
    return Divider(
      height: 6.h,
      thickness: 10,
      color: Colors.grey.shade200,
    );
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
                context.router.push(ReportLocationRoute(latLng: latLng!));
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

  Widget _buildDetailLaporan({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 8.sp,
            fontWeight: FontWeight.w400,
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
          ),
        ),
      ],
    );
  }
}
