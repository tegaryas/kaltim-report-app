import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/report/blocs/report_list_bloc/report_list_bloc.dart';

import 'package:kaltim_report/modules/report/components/report_card_list.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:sizer/sizer.dart';

import 'package:kaltim_report/configs/injectable/injectable_core.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReportListBloc>(
          create: (context) =>
              getIt.get<ReportListBloc>()..add(const ReportListStarted()),
        ),
      ],
      child: Scaffold(
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
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: BlocBuilder<ReportListBloc, ReportListState>(
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
                          child: ReportCardOnList(
                            report: entry,
                            onTap: () {
                              context
                                  .pushRoute(DetailReportRoute(report: entry));
                            },
                          ),
                        );
                      },
                    ),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 2.5.h),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
