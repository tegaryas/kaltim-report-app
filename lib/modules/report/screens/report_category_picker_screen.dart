import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/report/blocs/report_category/report_category_bloc.dart';
import 'package:kaltim_report/modules/report/models/report_category_model.dart';
import 'package:kaltim_report/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

class ReportCategoryPickerScreen extends StatefulWidget {
  final int? initialValue;
  const ReportCategoryPickerScreen({Key? key, this.initialValue})
      : super(key: key);

  @override
  State<ReportCategoryPickerScreen> createState() =>
      _ReportCategoryPickerScreenState();
}

class _ReportCategoryPickerScreenState
    extends State<ReportCategoryPickerScreen> {
  late ReportCategoryBloc reportCategoryBloc;

  @override
  void initState() {
    reportCategoryBloc = getIt.get<ReportCategoryBloc>()
      ..add(ReportCategoryFetch());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => reportCategoryBloc,
      child: BlocBuilder<ReportCategoryBloc, ReportCategoryState>(
        bloc: reportCategoryBloc,
        builder: (context, state) {
          if (state is ReportCategorySuccess) {
            return _buildWidgetSuccess(state.data);
          } else if (state is ReportCategoryFailed) {
            return _buildWidgetFailed();
          } else {
            return _buildWidgetLoading();
          }
        },
      ),
    );
  }

  Widget _buildWidgetSuccess(List<ReportCategoryModel> datas) {
    return RefreshIndicator(
      onRefresh: () =>
          Future.sync(() => reportCategoryBloc.add(ReportCategoryFetch())),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Kategori Laporan",
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: datas.length,
          itemBuilder: (context, index) {
            final data = datas[index];
            return ReportCategoryCard(
                data: data,
                selectedCategory: widget.initialValue == data.id,
                onTap: () {
                  context.popRoute(data);
                });
          },
        ),
      ),
    );
  }

  Widget _buildWidgetFailed() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kategori Laporan",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: ErrorPlaceholder(
          title: 'Ups Terjadi Kesalahan',
          subtitle:
              'Jangan panik, kamu bisa memuat ulang data dengan menekan tombol dibawah ini!',
          onTap: () {
            reportCategoryBloc.add(ReportCategoryFetch());
          },
        ),
      ),
    );
  }

  Widget _buildWidgetLoading() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kategori Laporan",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class ReportCategoryCard extends StatelessWidget {
  const ReportCategoryCard({
    Key? key,
    required this.data,
    required this.selectedCategory,
    this.onTap,
  }) : super(key: key);

  final ReportCategoryModel data;
  final bool selectedCategory;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: SizedBox(
        width: 35,
        height: 35,
        child: ImageNetworkBuild(
          imageUrl: data.imageUrl!,
          width: 35,
          height: 35,
        ),
      ),
      dense: true,
      selected: selectedCategory,
      selectedTileColor: Theme.of(context).primaryColorLight.withOpacity(0.2),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      title:
          Text(data.name, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: selectedCategory
          ? const Icon(
              Icons.check_circle,
            )
          : null,
    );
  }
}
