import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/profile/blocs/profile/profile_bloc.dart';
import 'package:kaltim_report/widgets/image_network_builder.dart';
import 'package:sizer/sizer.dart';

class DetailProfileScreen extends StatelessWidget {
  const DetailProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => getIt.get<ProfileBloc>()..add(ProfileFetching()),
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is ProfileLoaded) {
            return Scaffold(
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
                  'Akun Saya',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.5.h,
                    ),
                    BuildProfilePicture(
                      state: state,
                    ),
                    Divider(
                      height: 8.h,
                    ),
                    BuildProfileData(
                      label: "Alamat Email",
                      data: state.profile.email,
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    BuildProfileData(
                      label: "Nama Lengkap",
                      data: state.profile.name,
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    BuildProfileData(
                      label: "Nomor Handphone",
                      data: state.profile.phoneNumber ?? "Belum Diisi",
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    BuildProfileData(
                      label: "Alamat",
                      data: state.profile.address ?? "Belum Diisi",
                    ),
                  ],
                ),
              ),
            );
          }

          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}

class BuildProfileData extends StatelessWidget {
  const BuildProfileData({
    Key? key,
    required this.label,
    required this.data,
  }) : super(key: key);

  final String label;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          data,
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.black54,
          ),
        )
      ],
    );
  }
}

class BuildProfilePicture extends StatefulWidget {
  const BuildProfilePicture({Key? key, required this.state}) : super(key: key);

  final ProfileLoaded state;

  @override
  _BuildProfilePictureState createState() => _BuildProfilePictureState();
}

class _BuildProfilePictureState extends State<BuildProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: ProfileImageNetworkBuild(
            imageUrl: widget.state.profile.profilePic ?? '',
            height: 40.sp,
            width: 40.sp,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          "Ubah Foto Profile",
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
