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
      ),
    );
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
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              offset: Offset(0, -4),
              blurRadius: 15,
              color: Colors.black12,
            )
          ]),
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
                      color: Colors.white,
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
                                  ? const Color(0xFF1E9E9C)
                                  : Colors.grey,
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
                                  ? const Color(0xFF1E9E9C)
                                  : Colors.grey,
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
                      color: Colors.white,
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
                                  ? const Color(0xFF1E9E9C)
                                  : Colors.grey,
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
                                  ? const Color(0xFF1E9E9C)
                                  : Colors.grey,
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
                      color: Colors.white,
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
                                  ? const Color(0xFF1E9E9C)
                                  : Colors.grey,
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
                                  ? const Color(0xFF1E9E9C)
                                  : Colors.grey,
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
                      color: Colors.white,
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
                                  ? const Color(0xFF1E9E9C)
                                  : Colors.grey,
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
                                  ? const Color(0xFF1E9E9C)
                                  : Colors.grey,
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
        Positioned(
          bottom: 1.h,
          left: 0,
          right: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  context.router.push(AddReportRoute(reportTitle: "Report"));
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 7.h,
                      width: 7.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      height: 6.h,
                      width: 6.h,
                      decoration: const BoxDecoration(
                        color: const Color(0xFF1E9E9C),
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
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
