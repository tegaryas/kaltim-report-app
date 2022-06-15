import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/profile/blocs/profile/profile_bloc.dart';
import 'package:kaltim_report/modules/profile/blocs/profile_picture_update/profile_picture_update_bloc.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/widgets/image_network_builder.dart';
import 'package:sizer/sizer.dart';

class DetailProfileScreen extends StatelessWidget {
  const DetailProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (context) => getIt.get<ProfileBloc>()..add(ProfileFetching()),
        ),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
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
                    fontSize: 12.sp,
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
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: ProfileImageNetworkBuild(
                            imageUrl: state.profile.profilePic ?? '',
                            height: 40.sp,
                            width: 40.sp,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) => const PhotoEditModal(),
                            );
                          },
                          child: Text(
                            "Ubah Foto Profile",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textFaded,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            context.pushRoute(
                                ProfileEditRoute(profile: state.profile));
                          },
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blueGrey,
                            size: 15.sp,
                          ),
                        )
                      ],
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
            color: AppColors.textFaded,
          ),
        )
      ],
    );
  }
}

class PhotoEditModal extends StatefulWidget {
  const PhotoEditModal({
    Key? key,
  }) : super(key: key);

  @override
  PhotoEditModalState createState() => PhotoEditModalState();
}

class PhotoEditModalState extends State<PhotoEditModal> {
  final ImagePicker imagePicker = ImagePicker();

  late ProfilePictureUpdateBloc profilePictureUpdateBloc;

  @override
  void initState() {
    profilePictureUpdateBloc = getIt.get<ProfilePictureUpdateBloc>();
    super.initState();
  }

  @override
  void dispose() {
    profilePictureUpdateBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilePictureUpdateBloc>(
      create: (context) => profilePictureUpdateBloc,
      child: BlocConsumer<ProfilePictureUpdateBloc, ProfilePictureUpdateState>(
        bloc: profilePictureUpdateBloc,
        listener: (context, state) {
          if (state is ProfilePictureUpdateSuccess) {
            context.popRoute();
          }
        },
        builder: (context, state) {
          if (state is ProfilePictureUpdateLoading) {
            return Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 25,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Ganti Foto Profile',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(child: CircularProgressIndicator()),
                ],
              ),
            );
          }

          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Ganti Foto Profile',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  onTap: () {
                    uploadImageGallery(context);
                  },
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0,
                  ),
                  leading: const Icon(
                    Iconsax.gallery,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                  ),
                  title: Text(
                    'Pilih dari Galeri',
                    style: TextStyle(fontSize: 10.sp),
                  ),
                ),
                ListTile(
                  onTap: () {
                    uploadImageCamera(context);
                  },
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0,
                  ),
                  leading: const Icon(
                    Iconsax.camera,
                  ),
                  trailing: const Icon(
                    Icons.keyboard_arrow_right,
                  ),
                  title: Text(
                    'Pilih dari Camera',
                    style: TextStyle(fontSize: 10.sp),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> uploadImageGallery(BuildContext context) {
    return imagePicker
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
      maxHeight: 1000,
      maxWidth: 1000,
    )
        .then((image) {
      if (image != null) {
        context
            .read<ProfilePictureUpdateBloc>()
            .add(ProfilePictureUpdateAdd(image: image));
      }
    });
  }

  Future<void> uploadImageCamera(BuildContext context) async {
    imagePicker
        .pickImage(
      source: ImageSource.camera,
      imageQuality: 60,
      maxHeight: 1000,
      maxWidth: 1000,
    )
        .then((image) {
      if (image != null) {
        context
            .read<ProfilePictureUpdateBloc>()
            .add(ProfilePictureUpdateAdd(image: image));
      }
    });
  }
}
