import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/constant/constant.dart';
import 'package:kaltim_report/modules/report/blocs/report_bookmark_user/report_bookmark_user_bloc.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/modules/report/screens/components/report_card.dart';
import 'package:kaltim_report/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

class ReportUserBookmarkScreen extends StatelessWidget {
  const ReportUserBookmarkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ReportBookmarkUserBloc>()
        ..add(const ReportBookmarkUserListStarted()),
      child: Scaffold(
        appBar: AppBar(
          leading: const AutoLeadingButton(),
          title: Text(
            'Laporan Disimpan',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: BlocBuilder<ReportBookmarkUserBloc, ReportBookmarkUserState>(
          builder: (context, state) {
            if (state is ReportBookmarkUserListSuccess) {
              return _buildWidgetSuccess(state);
            } else {
              return ReportCardComponent.loader();
            }
          },
        ),
      ),
    );
  }

  Widget _buildWidgetSuccess(ReportBookmarkUserListSuccess state) {
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
                      children: [DetailReportRoute(id: entry.id)]));
                },
                onTapBookmark: () {
                  state.pagingController.refresh();
                },
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
                children:
                    List.generate(6, (index) => ReportCardComponent.loader()),
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
                'Laporan yang kamu simpan nanti akan tampilkan disini',
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
