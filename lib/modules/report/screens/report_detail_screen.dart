import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/report/blocs/report_detail/report_detail_bloc.dart';
import 'package:kaltim_report/modules/report/blocs/report_discussion/report_discussion_bloc.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/utils/converter_helper.dart';
import 'package:kaltim_report/widgets/image_gallery_screen.dart';
import 'package:kaltim_report/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

import 'components/status_report_badge.dart';

class DetailReportScreen extends StatefulWidget {
  const DetailReportScreen({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  State<DetailReportScreen> createState() => _DetailReportScreenState();
}

class _DetailReportScreenState extends State<DetailReportScreen> {
  late ReportDetailBloc reportDetailBloc;
  late ReportDiscussionBloc reportDiscussionBloc;

  final Completer<GoogleMapController> _mapsController = Completer();

  LatLng? latLng;
  List markers = [];
  List circles = [];

  @override
  void initState() {
    reportDetailBloc = getIt.get<ReportDetailBloc>()
      ..add(ReportDetailFetch(id: widget.id));

    reportDiscussionBloc = getIt.get<ReportDiscussionBloc>();
    super.initState();
  }

  @override
  void dispose() {
    reportDetailBloc.close();
    reportDiscussionBloc.close();
    super.dispose();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => reportDetailBloc,
        ),
        BlocProvider(
          create: (context) => reportDiscussionBloc,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Detail Laporan',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<ReportDetailBloc, ReportDetailState>(
              bloc: reportDetailBloc,
              listener: (context, state) {
                if (state is ReportDetailSucces) {
                  reportDiscussionBloc
                      .add(ReportDiscussionListFetch(widget.id));
                  latLng = LatLng(state.data.location.latitude,
                      state.data.location.longitude);
                  getMarkerandCircle();
                }
              },
            ),
          ],
          child: BlocBuilder<ReportDetailBloc, ReportDetailState>(
            bloc: reportDetailBloc,
            builder: (context, state) {
              if (state is ReportDetailSucces) {
                return _buildWidgetSuccess(state.data, context);
              } else if (state is ReportDetailFailed) {
                return _buildWidgetFailed();
              } else {
                return _buildWidgetLoading();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildWidgetFailed() {
    return ErrorPlaceholder(
      title: 'Yah ada kesalahan nih!',
      subtitle:
          "Terjadi kesalahan saat memuat data, kamu bisa ulangi dengan menekan tombol dibawah ini",
      onTap: () {
        reportDetailBloc.add(ReportDetailFetch(id: widget.id));
      },
    );
  }

  Widget _buildWidgetSuccess(ReportModel data, BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(() {
        reportDetailBloc.add(ReportDetailFetch(id: widget.id));
      }),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPictureSection(data),
            SizedBox(
              height: 2.h,
            ),
            _buildDetailLaporanSection(context, data),
            _buildDivider(),
            _buildLocationSection(data),
            _buildDivider(),
            _buildStatusReportSection(context, data),
            _buildDivider(),
            _buildDiscussionSection(data),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPictureSection(ReportModel data) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Material(
        child: InkWell(
          onTap: () {
            context.router
                .pushWidget(ImageGalleryScreen(imageUrls: [data.imageUrl]));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ImageNetworkBuild(
              imageUrl: data.imageUrl,
              height: 30.h,
              width: 100.w,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusReportSection(BuildContext context, ReportModel data) {
    return BlocBuilder<ReportDiscussionBloc, ReportDiscussionState>(
      builder: (context, state) {
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
                              data.reportProgress!.last.date, context),
                          style: TextStyle(
                            fontSize: 9.sp,
                            color: AppColors.textFaded,
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Text(
                          data.reportProgress!.last.statusProgress,
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
                  _statusTypeToWidget(data.reportProgress!.last.statusType),
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
                          progress: data.reportProgress!.reversed.toList()));
                    },
                    child: Text(
                      'Riwayat Selengkapnya',
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
      },
    );
  }

  Widget _buildDetailLaporanSection(BuildContext context, ReportModel data) {
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
            value: data.id,
            valueTextColor: Theme.of(context).colorScheme.secondary,
          ),
          SizedBox(
            height: 2.5.h,
          ),
          _buildDetailLaporan(
            title: "Permasalahan",
            value: data.problem,
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
                      data.dateInput!, context),
                ),
              ),
              Expanded(
                child: _buildDetailLaporan(
                  title: "Kategori",
                  value: data.category.name,
                  widget: Row(
                    children: [
                      ImageNetworkBuild(
                        imageUrl: data.category.imageUrl!,
                        height: 25,
                        width: 25,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        data.category.name,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (data.description != null)
            Column(
              children: [
                SizedBox(
                  height: 2.5.h,
                ),
                _buildDetailLaporan(
                  title: "Deskripsi Tambahan",
                  value: data.description!,
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

  Widget _buildLocationSection(ReportModel data) {
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
                      data.address,
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
            child: _buildLocationMaps(data),
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
          status: 'Validasi',
          backgroundColor: Colors.amber,
        );
      case ReportStatusType.tidakValid:
        return const StatusReportBadge(
          status: 'Tidak Valid',
          backgroundColor: Colors.black,
        );
      default:
        return Container();
    }
  }

  Widget _buildLocationMaps(ReportModel data) {
    return SizedBox(
      height: 35.h,
      width: 100.w,
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                data.location.latitude,
                data.location.longitude,
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
              if (!_mapsController.isCompleted) {
                _mapsController.complete(controller);
              }
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
    Widget? widget,
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
        if (widget == null)
          Text(
            value,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w600,
              height: 1.5,
              color: valueTextColor,
            ),
          )
        else
          widget,
      ],
    );
  }

  Widget _buildDiscussionSection(ReportModel data) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Diskusi Laporan",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 1.5.h,
          ),
          BlocBuilder<ReportDiscussionBloc, ReportDiscussionState>(
            bloc: reportDiscussionBloc,
            builder: (context, state) {
              if (state is ReportDiscussionListSuccess) {
                if (state.data.isEmpty) {
                  return Text(
                    "Belum ada komentar",
                    style: TextStyle(
                      fontSize: 9.sp,
                      color: AppColors.textFaded,
                    ),
                  );
                }
                return ListView.separated(
                  itemCount: state.data.take(2).length,
                  physics: const BouncingScrollPhysics(),
                  reverse: true,
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  itemBuilder: (context, index) {
                    final chat = state.data[index];

                    if (chat.userId == data.userId) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ChatBubble(
                            clipper:
                                ChatBubbleClipper4(type: BubbleType.sendBubble),
                            backGroundColor: Colors.grey.shade600,
                            alignment: Alignment.topRight,
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth:
                                    MediaQuery.of(context).size.width * 0.6,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    chat.userName!
                                        .replaceAll(RegExp(r'.(?=.{3})'), '*'),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8.sp,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    chat.comment,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    ConverterHelper.differenceTimeParse(
                                        chat.dateInput),
                                    style: TextStyle(
                                      color: Colors.grey.shade100,
                                      fontSize: 6.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: const ProfileImageNetworkBuild(
                              imageUrl: "",
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ],
                      );
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: const ProfileImageNetworkBuild(
                            imageUrl: "",
                            height: 30,
                            width: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ChatBubble(
                          backGroundColor: Colors.grey.shade200,
                          clipper: ChatBubbleClipper4(
                              type: BubbleType.receiverBubble),
                          child: Container(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.6,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chat.userName!
                                      .replaceAll(RegExp(r'.(?=.{3})'), '*'),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 8.sp,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  chat.comment,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10.sp,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  ConverterHelper.differenceTimeParse(
                                      chat.dateInput),
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 6.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                );
              } else if (state is ReportDiscussionListFailed) {
                return ErrorPlaceholder(
                  title: 'Ups Terjadi Kesalahan',
                  subtitle:
                      'Jangan panik, kamu bisa memuat ulang data dengan menekan tombol dibawah ini!',
                  onTap: () {
                    reportDiscussionBloc
                        .add(ReportDiscussionListFetch(widget.id));
                  },
                );
              } else {
                return Text(
                  "Belum ada komentar",
                  style: TextStyle(
                    fontSize: 9.sp,
                    color: AppColors.textFaded,
                  ),
                );
              }
            },
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
                  context.pushRoute(ReportDiscussionRoute(data: data));
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
}
