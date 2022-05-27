import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/covid/blocs/vaccination/vaccination_bloc.dart';
import 'package:kaltim_report/modules/covid/models/models.dart';
import 'package:kaltim_report/utils/converter_helper.dart';
import 'package:kaltim_report/widgets/error_screen_placeholder.dart';
import 'package:kaltim_report/widgets/image_network_builder.dart';
import 'package:sizer/sizer.dart';

class VaccinationScreen extends StatelessWidget {
  const VaccinationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<VaccinationBloc>()..add(VaccinationFetch()),
      child: BlocBuilder<VaccinationBloc, VaccinationState>(
        builder: (context, state) {
          if (state is VaccinationSuccess) {
            return _buildWidgetSuccess(context, state.data);
          } else if (state is VaccinationFailed) {
            return Scaffold(
              body: _buildWidgetFailed(context),
            );
          } else {
            return _buildWidgetLoading();
          }
        },
      ),
    );
  }

  Widget _buildWidgetLoading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildWidgetFailed(BuildContext context) {
    return ErrorPlaceholder(
      title: 'Ups Terjadi Kesalahan',
      subtitle: 'Kamu bisa menekan tombol dibawah ini untuk memuat ulang data',
      onTap: () {
        context.read<VaccinationBloc>().add(VaccinationFetch());
      },
    );
  }

  Widget _buildWidgetSuccess(BuildContext context, VaccinationModel data) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(
              margin: const EdgeInsets.only(
                left: 20,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  context.popRoute();
                },
                icon: Icon(
                  Icons.chevron_left,
                  size: 20.sp,
                ),
              ),
            ),
            floating: true,
            snap: true,
            expandedHeight: 30.h,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
                child: ImageNetworkBuild(
                  imageUrl:
                      "https://cdn.dribbble.com/users/59947/screenshots/15950120/media/4b32ff10ae402560810f8cc453adc846.jpg",
                  height: 30.h,
                  width: 100.w,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Data Vaksinasi',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    ConverterHelper.convertDateTimeToFullDateFormat(
                        data.lastUpdate, context),
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vaksinasi Pertama',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              data.sasaranvaksinlansia.toString(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Vaksinasi Kedua',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Text(
                              data.sasaranvaksinlansia.toString(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 5.h,
                    color: Theme.of(context).dividerColor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vaksinasi Lansia',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        data.sasaranvaksinlansia.toString(),
                      ),
                    ],
                  ),
                  Divider(
                    height: 5.h,
                    color: Theme.of(context).dividerColor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vaksinasi DMK',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        data.sasaranvaksinsdmk.toString(),
                      ),
                    ],
                  ),
                  Divider(
                    height: 5.h,
                    color: Theme.of(context).dividerColor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vaksinasi Petugas',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Text(
                        data.sasaranvaksinpetugaspublik.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
