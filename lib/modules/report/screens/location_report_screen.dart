import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

class ReportLocationScreen extends StatefulWidget {
  const ReportLocationScreen({
    Key? key,
    required this.latLng,
  }) : super(key: key);

  final LatLng latLng;

  @override
  State<ReportLocationScreen> createState() => _ReportLocationScreenState();
}

class _ReportLocationScreenState extends State<ReportLocationScreen> {
  final Completer<GoogleMapController> _mapsController = Completer();
  LatLng? latLng;
  List markers = [];
  List circles = [];

  @override
  void initState() {
    latLng = LatLng(widget.latLng.latitude, widget.latLng.longitude);
    getMapsMarker();
    super.initState();
  }

  void getMapsMarker() {
    final googleMarker = Marker(
      markerId: const MarkerId('_reportLocationMark'),
      infoWindow: const InfoWindow(title: "Titik Permasalahan"),
      icon: BitmapDescriptor.defaultMarker,
      position: latLng!,
    );

    setState(() {
      markers.add(googleMarker);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lokasi Permasalahan',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: _buildLocationMaps(),
    );
  }

  Widget _buildLocationMaps() {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.latLng.latitude,
            widget.latLng.longitude,
          ),
          zoom: 15,
        ),
        markers: Set.from(
          markers,
        ),
        circles: Set.from(
          circles,
        ),
        rotateGesturesEnabled: true,
        compassEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        onMapCreated: (controller) {
          _mapsController.complete(controller);
        },
      ),
    );
  }
}
