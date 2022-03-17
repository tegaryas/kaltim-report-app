import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/call/blocs/calls/call_bloc.dart';
import 'package:kaltim_report/modules/home/blocs/feature/feature_bloc.dart';
import 'package:kaltim_report/modules/profile/blocs/profile/profile_bloc.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/widgets/custom_button.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime? currentBackPressTime;

    Future<bool> onWillPop() async {
      final DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
        currentBackPressTime = now;
        Fluttertoast.showToast(msg: "Tekan sekali lagi untuk keluar");
        return false;
      }
      return true;
    }

    bool onTabsWillPop(TabsRouter tabsRouter) {
      if (tabsRouter.activeIndex == 0) {
        return true;
      }
      tabsRouter.setActiveIndex(0);
      return false;
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider<FeatureBloc>(
          create: (context) => getIt.get<FeatureBloc>()..add(FeatureFetching()),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => getIt.get<ProfileBloc>()..add(ProfileFetching()),
        ),
        BlocProvider<CallBloc>(
            create: (context) =>
                getIt.get<CallBloc>()..add(EmergencyCallFetching())),
      ],
      child: AutoTabsScaffold(
        routes: const [
          HomeRoute(),
          CallRoute(),
          NewsRoute(),
          ProfileRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return WillPopScope(
            onWillPop: () async {
              if (onTabsWillPop(tabsRouter)) {
                return onWillPop();
              } else {
                return false;
              }
            },
            child: _customNavBar(tabsRouter),
          );
        },
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () async {
                  await checkLocationPermission();
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 7.h,
                      width: 7.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).shadowColor,
                      ),
                    ),
                    Container(
                      height: 6.h,
                      width: 6.h,
                      decoration: const BoxDecoration(
                        color: Color(0xFF1E9E9C),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Iconsax.camera5,
                        size: 3.h,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Tambah',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 8.sp,
                  color: AppColors.textFaded,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkLocationPermission() async {
    var status = await Permission.locationWhenInUse.status;
    if (status.isGranted) {
      context.router.push(AddReportRoute(reportTitle: "Report"));
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    } else {
      showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Ups masih belum dapat izin kamu!',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Kasih izin dong buat akses lokasi mu, biar saat melaporkan masalah bisa kasih lokasi yang akurat',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.textFaded,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                CustomButton(
                  text: 'Oke, Izinkan',
                  onTap: () async {
                    await Permission.locationWhenInUse.request();
                  },
                )
              ],
            ),
          );
        },
      );
    }
  }

  Widget _customNavBar(TabsRouter tabsRouter) {
    var size = MediaQuery.of(context).size;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          height: 7.h,
          decoration: BoxDecoration(
            color: Theme.of(context).shadowColor,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, -4),
                blurRadius: 15,
                color: Colors.black12,
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      tabsRouter.setActiveIndex(0);
                    },
                    child: Container(
                      width: size.width * 0.15,
                      color: Theme.of(context).shadowColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Icon(
                              tabsRouter.activeIndex == 0
                                  ? Iconsax.home
                                  : Iconsax.home,
                              color: tabsRouter.activeIndex == 0
                                  ? AppColors.secondary
                                  : AppColors.textFaded,
                              size: 3.h,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Beranda',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                              color: tabsRouter.activeIndex == 0
                                  ? AppColors.secondary
                                  : AppColors.textFaded,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      tabsRouter.setActiveIndex(1);
                    },
                    child: Container(
                      width: size.width * 0.15,
                      color: Theme.of(context).shadowColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Icon(
                              tabsRouter.activeIndex == 1
                                  ? Iconsax.call
                                  : Iconsax.call,
                              color: tabsRouter.activeIndex == 1
                                  ? AppColors.secondary
                                  : AppColors.textFaded,
                              size: 3.h,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Telpon',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                              color: tabsRouter.activeIndex == 1
                                  ? AppColors.secondary
                                  : AppColors.textFaded,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      tabsRouter.setActiveIndex(2);
                    },
                    child: Container(
                      width: size.width * 0.15,
                      color: Theme.of(context).shadowColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Icon(
                              tabsRouter.activeIndex == 2
                                  ? Iconsax.archive
                                  : Iconsax.archive,
                              color: tabsRouter.activeIndex == 2
                                  ? AppColors.secondary
                                  : AppColors.textFaded,
                              size: 3.h,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Berita',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                              color: tabsRouter.activeIndex == 2
                                  ? AppColors.secondary
                                  : AppColors.textFaded,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      tabsRouter.setActiveIndex(3);
                    },
                    child: Container(
                      width: size.width * 0.15,
                      color: Theme.of(context).shadowColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            child: Icon(
                              tabsRouter.activeIndex == 3
                                  ? Iconsax.profile_circle
                                  : Iconsax.profile_circle,
                              color: tabsRouter.activeIndex == 3
                                  ? AppColors.secondary
                                  : AppColors.textFaded,
                              size: 3.h,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Akun',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                              color: tabsRouter.activeIndex == 3
                                  ? AppColors.secondary
                                  : AppColors.textFaded,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
