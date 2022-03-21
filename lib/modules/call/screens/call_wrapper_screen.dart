import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/call/blocs/calls/call_bloc.dart';

class CallWrapperScreen extends StatelessWidget {
  const CallWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CallBloc>(
            create: (context) =>
                getIt.get<CallBloc>()..add(EmergencyCallFetching())),
      ],
      child: const AutoRouter(),
    );
  }
}
