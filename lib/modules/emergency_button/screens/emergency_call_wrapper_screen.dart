import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/emergency_button/blocs/emergency_call/emergency_call_bloc.dart';
import 'package:kaltim_report/modules/emergency_button/blocs/emergency_call_list/emergency_call_list_bloc.dart';
import 'package:kaltim_report/modules/emergency_button/blocs/emergency_validate_phone_number/emergency_validate_phone_number_bloc.dart';

class EmergencyCallWrapperScreen extends StatelessWidget {
  const EmergencyCallWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmergencyCallBloc>(
          create: (context) => getIt.get<EmergencyCallBloc>(),
        ),
        BlocProvider<EmergencyValidatePhoneNumberBloc>(
          create: (context) => getIt.get<EmergencyValidatePhoneNumberBloc>()
            ..add(EmergencyValidatePhoneNumberCheck()),
        ),
        BlocProvider<EmergencyCallListBloc>(
          create: (context) =>
              getIt.get<EmergencyCallListBloc>()..add(EmergencyCallListFetch()),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
