import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/constant/constant.dart';
import 'package:kaltim_report/modules/report/blocs/report_list_bloc/report_list_bloc.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/widgets/error_screen_placeholder.dart';
import 'package:sizer/sizer.dart';

import 'components/report_card.dart';

class ReportAdminScreen extends StatefulWidget {
  final int? initialIndex;
  const ReportAdminScreen({Key? key, this.initialIndex}) : super(key: key);

  @override
  State<ReportAdminScreen> createState() => _ReportAdminScreenState();
}

class _ReportAdminScreenState extends State<ReportAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 5,
        initialIndex: widget.initialIndex ?? 0,
        child: NestedScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  "Laporan Warga",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      context.pushRoute(const ReportRouter(
                          children: [ReportExportDataRoute()]));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.file_download_outlined,
                            size: 20,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Export Data',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
                pinned: true,
                floating: true,
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      isScrollable: true,
                      tabs: [
                        Tab(
                          child: Text("Semua"),
                        ),
                        Tab(
                          child: Text("Menunggu"),
                        ),
                        Tab(
                          child: Text("Proses"),
                        ),
                        Tab(
                          child: Text("Selesai"),
                        ),
                        Tab(
                          child: Text("Ditolak"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              BlocProvider<ReportListBloc>(
                create: (context) =>
                    getIt.get<ReportListBloc>()..add(const ReportListStarted()),
                child: _buildListByStatus(),
              ),
              BlocProvider<ReportListBloc>(
                create: (context) => getIt.get<ReportListBloc>()
                  ..add(const ReportListStarted(
                      status: ReportStatusType.menunggu)),
                child: _buildListByStatus(),
              ),
              BlocProvider<ReportListBloc>(
                create: (context) => getIt.get<ReportListBloc>()
                  ..add(
                      const ReportListStarted(status: ReportStatusType.proses)),
                child: _buildListByStatus(),
              ),
              BlocProvider<ReportListBloc>(
                create: (context) => getIt.get<ReportListBloc>()
                  ..add(const ReportListStarted(
                      status: ReportStatusType.selesai)),
                child: _buildListByStatus(),
              ),
              BlocProvider<ReportListBloc>(
                create: (context) => getIt.get<ReportListBloc>()
                  ..add(const ReportListStarted(
                      status: ReportStatusType.tidakValid)),
                child: _buildListByStatus(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListByStatus() {
    return BlocBuilder<ReportListBloc, ReportListState>(
      builder: (context, state) {
        if (state is ReportListSuccess) {
          return RefreshIndicator(
            onRefresh: () => Future.sync(() {
              state.pagingController.refresh();
            }),
            child: PagedListView<String, ReportModel>.separated(
              pagingController: state.pagingController,
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                bottom: 40,
                top: 20,
              ),
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, entry, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: ReportCardComponent(
                      report: entry,
                      onTap: () {
                        context.navigateTo(ReportRouter(
                            children: [ReportDetailAdminRoute(id: entry.id)]));
                      },
                      isShowBookmark: false,
                    ),
                  );
                },
                noItemsFoundIndicatorBuilder: (context) {
                  return _buildReportEmpty();
                },
                firstPageErrorIndicatorBuilder: (context) {
                  return ErrorPlaceholder(
                    title: 'Ups Terjadi Kesalahan',
                    subtitle:
                        'Kamu bisa menekan tombol dibawah ini untuk memuat ulang data',
                    onTap: () {
                      state.pagingController.refresh();
                    },
                  );
                },
                firstPageProgressIndicatorBuilder: (context) {
                  return SizedBox(
                    height: 100.h,
                    width: 100.w,
                    child: Column(
                      children: List.generate(
                          6, (index) => ReportCardComponent.loader()),
                    ),
                  );
                },
              ),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Divider(
                  height: 6.h,
                  thickness: 2,
                ),
              ),
            ),
          );
        } else {
          return ReportCardComponent.loader();
        }
      },
    );
  }

  Widget _buildReportEmpty() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20.h,
          width: 100.w,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              Assets.images.onboardingSlide1.path,
            ),
          )),
        ),
        SizedBox(
          height: 1.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Laporan Masih Kosong',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Text(
                'Laporan warga nanti akan tampilkan disini',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 10.sp,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
