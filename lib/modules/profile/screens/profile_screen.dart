import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/theme.dart';

import 'package:sizer/sizer.dart';
import 'package:skeletons/skeletons.dart';

import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/core/bloc/auth_bloc.dart';
import 'package:kaltim_report/modules/profile/blocs/profile/profile_bloc.dart';
import 'package:kaltim_report/modules/profile/models/environment_model.dart';
import 'package:kaltim_report/widgets/image_network_builder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final envModel = getIt.get<EnvironmentModel>();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Pengaturan',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return _buildProfileHeaderLoading();
                } else if (state is ProfileLoaded) {
                  return _buildProfileHeader(state);
                } else {
                  return _buildProfileHeaderLoading();
                }
              },
            ),
            SizedBox(
              height: 3.h,
            ),
            _buildTitleList('Akun'),
            SizedBox(
              height: 1.h,
            ),
            _buidlListTile(
              onTap: () {
                context.router.push(const DetailProfileRoute());
              },
              icon: Iconsax.profile_circle,
              title: "Akun",
            ),
            _buidlListTile(
              onTap: () {
                context.router.push(const ReportUserRoute());
              },
              icon: Iconsax.chart,
              title: "Laporanku",
            ),
            _buidlListTile(
              onTap: () {
                context.pushRoute(
                    const ReportRouter(children: [ReportUserBookmarkRoute()]));
              },
              icon: Iconsax.save_2,
              title: "Laporan Disimpan",
            ),
            _buidlListTile(
              onTap: () {
                context.router.push(const ChangePasswordRoute());
              },
              icon: Iconsax.password_check,
              title: "Ganti Password",
            ),
            SizedBox(
              height: 2.5.h,
            ),
            _buildTitleList('Tentang'),
            SizedBox(
              height: 1.h,
            ),
            _buidlListTile(
              onTap: () {
                context.navigateTo(const AboutRoute());
              },
              icon: Iconsax.info_circle,
              title: "Tentang Aplikasi",
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return _buidlListTile(
                  onTap: () {
                    context.read<AuthBloc>().add(AuthLogout());
                  },
                  icon: Iconsax.logout_1,
                  title: "Logout",
                );
              },
            ),
            SizedBox(
              height: 2.5.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Version ${envModel.appVersion}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "#SigapAja",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeaderLoading() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Row(
        children: [
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
              shape: BoxShape.circle,
              width: 40.sp,
              height: 40.sp,
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          Expanded(
            child: SkeletonParagraph(
              style: SkeletonParagraphStyle(
                lines: 2,
                spacing: 0.8.h,
                lineStyle: SkeletonLineStyle(
                  randomLength: true,
                  height: 10,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProfileHeader(ProfileLoaded state) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: ProfileImageNetworkBuild(
              imageUrl: state.profile.profilePic ?? "",
              height: 40.sp,
              width: 40.sp,
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                state.profile.name,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                state.profile.email,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTitleList(String title) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 10.sp,
          color: AppColors.textFaded,
        ),
      ),
    );
  }

  Widget _buidlListTile({
    required String title,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20.sp,
              color: Colors.blueGrey,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.keyboard_arrow_right,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
