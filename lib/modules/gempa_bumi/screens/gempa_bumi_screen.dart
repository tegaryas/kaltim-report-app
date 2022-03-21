import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/modules/gempa_bumi/blocs/gempa_bumi_last_recently_bloc/gempa_bumi_last_recently_bloc.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/utils/converter_helper.dart';
import 'package:kaltim_report/widgets/error_screen_placeholder.dart';
import 'package:sizer/sizer.dart';

class GempaBumiScreen extends StatelessWidget {
  const GempaBumiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                title: Text(
                  "Gempa Bumi",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
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
            ];
          },
          body: TabBarView(
            children: [
              Container(),
              Container(),
              BlocBuilder<GempaBumiLastRecentlyBloc,
                  GempaBumiLastRecentlyState>(
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
                          return Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.radar,
                                            size: 12.sp,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Text(
                                            "Wilayah",
                                            style: TextStyle(
                                              fontSize: 9.sp,
                                              fontWeight: FontWeight.normal,
                                              color: AppColors.textFaded,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      Text(
                                        entry.wilayah,
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.bold,
                                          height: 1.5,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        entry.tanggal + "  " + entry.jam,
                                        style: TextStyle(
                                          fontSize: 9.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      entry.magnitude,
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            ConverterHelper.skalaRichterToColor(
                                                double.parse(entry.magnitude)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Text(
                                      "Skala richter",
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.textFaded,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
