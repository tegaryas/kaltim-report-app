import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
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

    return AutoTabsScaffold(
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
                                  ? Colors.blueGrey
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
                                  ? Colors.blueGrey
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
                                  ? Iconsax.activity
                                  : Iconsax.activity,
                              color: tabsRouter.activeIndex == 1
                                  ? Colors.blueGrey
                                  : Colors.grey,
                              size: 3.h,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Laporan',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 8.sp,
                              color: tabsRouter.activeIndex == 1
                                  ? Colors.blueGrey
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
                                  ? Colors.blueGrey
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
                                  ? Colors.blueGrey
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
                                  ? Colors.blueGrey
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
                                  ? Colors.blueGrey
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
                  context.router.push(const ReportRoute());
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
                        color: Colors.blueGrey,
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
