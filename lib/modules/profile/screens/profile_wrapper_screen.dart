import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/profile/blocs/profile/profile_bloc.dart';

class ProfileWrapperScreen extends StatelessWidget {
  const ProfileWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileBloc>(
          create: (context) => getIt.get<ProfileBloc>()..add(ProfileFetching()),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
