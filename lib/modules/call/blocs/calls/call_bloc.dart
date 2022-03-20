import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/call/models/emergency_call_model.dart';
import 'package:kaltim_report/modules/call/repositories/call_repository_interface.dart';

part 'call_event.dart';
part 'call_state.dart';

@injectable
class CallBloc extends Bloc<CallEvent, CallState> {
  StreamSubscription? _callsSubsription;
  final CallRepositoryInterface callRepository;
  final FirebaseCrashlytics firebaseCrashlytics;

  CallBloc({
    required this.callRepository,
    required this.firebaseCrashlytics,
  }) : super(CallInitial()) {
    on<EmergencyCallFetching>((event, emit) {
      _callsSubsription?.cancel();
      try {
        emit(CallLoading());
        _callsSubsription =
            callRepository.getEmergencyCallList().listen((event) {
          add(EmergencyCallUpdate(calls: event));
        });
      } catch (e, s) {
        firebaseCrashlytics.recordError(e, s);
        emit(CallFailed());
      }
    });

    on<EmergencyCallUpdate>((event, emit) {
      emit(CallLoaded(calls: event.calls));
    });
  }

  @override
  Future<void> close() {
    _callsSubsription?.cancel();
    return super.close();
  }
}
