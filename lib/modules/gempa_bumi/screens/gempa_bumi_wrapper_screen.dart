import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/gempa_bumi/blocs/gempa_bumi_bloc/gempa_bumi_bloc.dart';
import 'package:kaltim_report/modules/gempa_bumi/blocs/gempa_bumi_last_recently_bloc/gempa_bumi_last_recently_bloc.dart';

class GempaBumiWrapperScreen extends StatelessWidget {
  const GempaBumiWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GempaBumiBloc>(
          create: (context) =>
              getIt.get<GempaBumiBloc>()..add(GempaBumiFetch()),
        ),
        BlocProvider<GempaBumiLastRecentlyBloc>(
          create: (context) => getIt.get<GempaBumiLastRecentlyBloc>()
            ..add(GempaBumiLastRecentlyFetch()),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
