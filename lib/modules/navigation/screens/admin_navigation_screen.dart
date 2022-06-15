import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/theme.dart';
import 'package:sizer/sizer.dart';

class AdminNavigationScreen extends StatefulWidget {
  const AdminNavigationScreen({Key? key}) : super(key: key);

  @override
  State<AdminNavigationScreen> createState() => _AdminNavigationScreenState();
}

class _AdminNavigationScreenState extends State<AdminNavigationScreen> {
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
        HomeAdminRouter(),
        ReportAdminRouter(),
        ProfileAdminRouter(),
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
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
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
                      tabsRouter.activeIndex == 0 ? Iconsax.home : Iconsax.home,
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
                      tabsRouter.activeIndex == 1 ? Iconsax.task : Iconsax.task,
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
                    'Laporan',
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
          const SizedBox(
            width: 15,
          ),
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
                          ? Iconsax.profile_circle
                          : Iconsax.profile_circle,
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
                    'Akun',
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
        ],
      ),
    );
  }
}
