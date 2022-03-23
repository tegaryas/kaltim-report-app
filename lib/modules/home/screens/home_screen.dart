import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/constant/assets.gen.dart';
import 'package:kaltim_report/modules/gempa_bumi/blocs/gempa_bumi_bloc/gempa_bumi_bloc.dart';
import 'package:kaltim_report/modules/home/blocs/banner/banner_bloc.dart';
import 'package:kaltim_report/modules/home/blocs/home_report/home_report_bloc.dart';
import 'package:kaltim_report/modules/home/screens/sections/banner_home_section.dart';
import 'package:kaltim_report/modules/home/screens/sections/covid_home_section.dart';
import 'package:kaltim_report/modules/home/screens/sections/feature_home_section.dart';
import 'package:kaltim_report/modules/home/screens/sections/gempa_bumi_section.dart';
import 'package:kaltim_report/modules/home/screens/sections/laporan_section.dart';
import 'package:kaltim_report/modules/profile/blocs/profile/profile_bloc.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(() {
        context.read<GempaBumiBloc>().add(GempaBumiFetch());
        context.read<BannerBloc>().add(BannerFetch());
        context.read<HomeReportBloc>().add(HomeReportFetch());
      }),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.primary,
            automaticallyImplyLeading: false,
            title: Image.asset(
              Assets.icons.logoText.path,
              height: 28,
              fit: BoxFit.fitHeight,
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        if (state is ProfileLoaded) {
                          return Text(
                            'Halo ${state.profile.name.split(' ').first} 👋',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        }

                        return Text(
                          'Halo,',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 0.5.h,
                    ),
                    Text(
                      'Laporankan kejadian disekitar mu dengan mudah, silahkan tekan tombol tambah untuk membuat laporan',
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4.h,
                    ),
                    const FeatureHomeSection(),
                    const BannerHomeSection(),
                    Divider(
                      thickness: 6,
                      height: 6.h,
                    ),
                    const CovidHomeSection(),
                    Divider(
                      thickness: 6,
                      height: 6.h,
                    ),
                    const GempaBumiHomeSection(),
                    Divider(
                      thickness: 6,
                      height: 6.h,
                    ),
                    const LaporanSection()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
