import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:kaltim_report/modules/gempa_bumi/blocs/gempa_bumi_last_recently_bloc/gempa_bumi_last_recently_bloc.dart';
import 'package:kaltim_report/modules/gempa_bumi/blocs/gempa_bumi_magnetudo_bloc/gempa_bumi_magnetudo_bloc.dart';
import 'package:kaltim_report/modules/gempa_bumi/screens/components/gempa_bumi_card.dart';
import 'package:kaltim_report/modules/report/blocs/geolocation/geolocation_bloc.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/utils/converter_helper.dart';
import 'package:kaltim_report/widgets/error_screen_placeholder.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

import '../blocs/gempa_bumi_bloc/gempa_bumi_bloc.dart';

class GempaBumiScreen extends StatefulWidget {
  const GempaBumiScreen({Key? key}) : super(key: key);

  @override
  State<GempaBumiScreen> createState() => _GempaBumiScreenState();
}

class _GempaBumiScreenState extends State<GempaBumiScreen> {
  late String coordinatGempa;
  late String magnitudoGempa;
  late String datetimeGempa;
  late String kedalamanGempa;
  late String lokasiGempa;
  String? potensiGempa;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Gempa Bumi",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Share.share(
                  '''#Gempa Bumi

$lokasiGempa
                  
Magnitudo: $magnitudoGempa Skala Richter
Tanggal & Waktu: $datetimeGempa
Koordinat: $coordinatGempa
Kedalaman: $kedalamanGempa
Potensi: $potensiGempa
                    
#BMKG #SIGAP #SelaluSiapSediaUntukmu

https://www.bmkg.go.id/gempabumi/gempabumi-terkini.bmkg''',
                );
              },
              icon: Icon(
                Ionicons.share_social_outline,
                size: 16.sp,
              ),
            )
          ],
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Text("Terkini"),
                  ),
                  Tab(
                    child: Text("Magnitudo 5"),
                  ),
                  Tab(
                    child: Text("Beberapa Hari Lalu"),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _buildGempaBumiTerkini(),
            _buildMagnetudoGempa(),
            _buildLastRecentlyGempa(),
          ],
        ),
      ),
    );
  }

  Widget _buildGempaBumiTerkini() {
    return BlocBuilder<GeolocationBloc, GeolocationState>(
      builder: (context, geoLocationState) {
        if (geoLocationState is GeolocationLoaded) {
          return BlocBuilder<GempaBumiBloc, GempaBumiState>(
            builder: (context, state) {
              if (state is GempaBumiSuccess) {
                var latLang = state.data.coordinates.split(",");

                var distance = Geolocator.distanceBetween(
                        double.parse(latLang[0]),
                        double.parse(latLang[1]),
                        geoLocationState.position.latitude,
                        geoLocationState.position.longitude) /
                    1000;

                coordinatGempa = '${state.data.lintang}, ${state.data.bujur}';
                magnitudoGempa = state.data.magnitude;
                datetimeGempa = "${state.data.tanggal} ${state.data.jam}";
                kedalamanGempa = state.data.kedalaman;
                lokasiGempa = state.data.wilayah;
                potensiGempa = state.data.potensi;

                return SizedBox(
                  height: 100.h,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 60.h,
                        child: GoogleMap(
                          zoomControlsEnabled: false,
                          zoomGesturesEnabled: true,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: false,
                          mapToolbarEnabled: false,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                              double.parse(latLang[0]),
                              double.parse(latLang[1]),
                            ),
                            zoom: 7,
                          ),
                          circles: {
                            Circle(
                              circleId: CircleId(state.data.wilayah),
                              fillColor: Colors.red.withOpacity(0.1),
                              strokeColor: Colors.red.withOpacity(0.5),
                              strokeWidth: 1,
                              center: LatLng(
                                double.parse(latLang[0]),
                                double.parse(latLang[1]),
                              ),
                              radius: 30 * 1000,
                            ),
                          },
                          markers: {
                            Marker(
                              markerId: MarkerId(state.data.wilayah),
                              infoWindow: InfoWindow(
                                title: "Titik Gempa",
                                snippet:
                                    'Jarak dari lokasi anda ${NumberFormat.decimalPattern().format(distance)} km',
                              ),
                              icon: BitmapDescriptor.defaultMarker,
                              position: LatLng(
                                double.parse(latLang[0]),
                                double.parse(latLang[1]),
                              ),
                            )
                          },
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Spacer(),
                          Container(
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                            ),
                            padding: EdgeInsets.only(
                              left: 24,
                              right: 24,
                              top: 20,
                              bottom: 6.h,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 5,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        color: AppColors.textFaded
                                            .withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  'Status dan Statistik Gempa',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Text(
                                  state.data.wilayah,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: AppColors.textFaded,
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            ConverterHelper.differenceTimeParse(
                                                state.data.dateTime),
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            state.data.tanggal,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            state.data.jam,
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                      child: VerticalDivider(
                                        thickness: 1,
                                        color: Theme.of(context).dividerColor,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Iconsax.chart_3,
                                            color: Colors.red,
                                            size: 18.sp,
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Text(
                                            state.data.magnitude,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Text(
                                            'Magnitudo',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                      child: VerticalDivider(
                                        thickness: 1,
                                        color: Theme.of(context).dividerColor,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Icon(
                                            Iconsax.radar_2,
                                            color: Colors.green,
                                            size: 18.sp,
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Text(
                                            state.data.kedalaman,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          Text(
                                            'Kedalaman',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              } else if (state is GempaBumiFailed) {
                return ErrorPlaceholder(
                  title: 'Yah ada kesalahan nih!',
                  subtitle:
                      "Terjadi kesalahan saat memuat data gempa, kamu bisa ulangi dengan menekan tombol dibawah ini",
                  onTap: () {
                    context.read<GempaBumiBloc>().add(GempaBumiFetch());
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildMagnetudoGempa() {
    return BlocBuilder<GempaBumiMagnetudoBloc, GempaBumiMagnetudoState>(
      builder: (context, state) {
        if (state is GempaBumiMagnetudoSuccess) {
          return RefreshIndicator(
            onRefresh: () => Future.sync(() {
              context
                  .read<GempaBumiMagnetudoBloc>()
                  .add(GempaBumiMagnetudoFetch());
            }),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final entry = state.data[index];
                return GempaBumiCard(entry: entry);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 6.h,
                  thickness: 2,
                );
              },
            ),
          );
        } else if (state is GempaBumiMagnetudoFailed) {
          return ErrorPlaceholder(
            title: 'Ups Terjadi Kesalahan',
            subtitle:
                'Kamu bisa menekan tombol dibawah ini untuk memuat ulang data',
            onTap: () {
              context
                  .read<GempaBumiMagnetudoBloc>()
                  .add(GempaBumiMagnetudoFetch());
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildLastRecentlyGempa() {
    return BlocBuilder<GempaBumiLastRecentlyBloc, GempaBumiLastRecentlyState>(
      builder: (context, state) {
        if (state is GempaBumiLastRecentlySuccess) {
          return RefreshIndicator(
            onRefresh: () => Future.sync(() {
              context
                  .read<GempaBumiLastRecentlyBloc>()
                  .add(GempaBumiLastRecentlyFetch());
            }),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final entry = state.data[index];
                return GempaBumiCard(entry: entry);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 6.h,
                  thickness: 2,
                );
              },
            ),
          );
        } else if (state is GempaBumiLastRecentlyFailed) {
          return ErrorPlaceholder(
            title: 'Ups Terjadi Kesalahan',
            subtitle:
                'Kamu bisa menekan tombol dibawah ini untuk memuat ulang data',
            onTap: () {},
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
