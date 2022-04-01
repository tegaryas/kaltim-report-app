import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/emergency/blocs/emergency_call/emergency_call_bloc.dart';

class EmergencyCallWrapperScreen extends StatelessWidget {
  const EmergencyCallWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmergencyCallBloc>(
          create: (context) => getIt.get<EmergencyCallBloc>(),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
