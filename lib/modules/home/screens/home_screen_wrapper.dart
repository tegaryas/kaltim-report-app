import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/gempa_bumi/blocs/gempa_bumi_bloc/gempa_bumi_bloc.dart';
import 'package:kaltim_report/modules/home/blocs/feature/feature_bloc.dart';
import 'package:kaltim_report/modules/profile/blocs/profile/profile_bloc.dart';

class HomeWrapperScreen extends StatelessWidget {
  const HomeWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GempaBumiBloc>(
            create: (context) =>
                getIt.get<GempaBumiBloc>()..add(GempaBumiFetch())),
        BlocProvider<FeatureBloc>(
          create: (context) => getIt.get<FeatureBloc>()..add(FeatureFetching()),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => getIt.get<ProfileBloc>()..add(ProfileFetching()),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
