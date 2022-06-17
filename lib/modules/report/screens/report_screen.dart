import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/report/blocs/report_list_bloc/report_list_bloc.dart';

import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/modules/report/screens/components/report_card.dart';
import 'package:kaltim_report/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              context.router.pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 18.sp,
            ),
          ),
          title: Text(
            'SiLapor',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: BlocBuilder<ReportListBloc, ReportListState>(
          builder: (context, state) {
            if (state is ReportListSuccess) {
              return _buildWidgetSuccess(state);
            } else {
              return ReportCardComponent.loader();
            }
          },
        ));
  }

  Widget _buildWidgetSuccess(ReportListSuccess state) {
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
                  context.pushRoute(DetailReportRoute(id: entry.id));
                },
              ),
            );
          },
          firstPageErrorIndicatorBuilder: (context) {
            return ErrorPlaceholder(
              title: 'Ups Terjadi Kesalahan',
              subtitle:
                  'Jangan panik, kamu bisa memuat ulang data dengan menekan tombol dibawah ini!',
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
}
