import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';

import 'package:kaltim_report/modules/report/components/report_card_list.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:paginate_firestore/bloc/pagination_listeners.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:sizer/sizer.dart';

import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/report/blocs/report/report_bloc.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  PaginateRefreshedChangeListener refreshChangeListener =
      PaginateRefreshedChangeListener();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReportBloc>(
          create: (context) => getIt.get<ReportBloc>()..add(FetchReportList()),
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
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          body: RefreshIndicator(
            child: PaginateFirestore(
              itemBuilder: (context, documentSnapshots, index) {
                final report = ReportModel.fromJson(
                    documentSnapshots[index].data() as Map<String, dynamic>);

                return ReportCardOnList(
                  report: report,
                  onTap: () {
                    context.router.push(DetailReportRoute(report: report));
                  },
                );
              },
              bottomLoader: const BottomLoader(),
              query: FirebaseFirestore.instance
                  .collection('Report')
                  .orderBy('dateInput', descending: true),
              listeners: [
                refreshChangeListener,
              ],
              isLive: true,
              itemsPerPage: 10,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              separator: SizedBox(
                height: 2.5.h,
              ),
              itemBuilderType: PaginateBuilderType.listView,
            ),
            onRefresh: () async {
              refreshChangeListener.refreshed = true;
            },
          )),
    );
  }
}

class BottomLoader extends StatelessWidget {
  const BottomLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 3.h,
        width: 3.h,
        child: const CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
