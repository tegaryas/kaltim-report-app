import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/emergency_button/models/emergency_call_model.dart';
import 'package:kaltim_report/modules/emergency_button/repositories/emergency_call_repository_interface.dart';

part 'emergency_call_stream_event.dart';
part 'emergency_call_stream_state.dart';

@injectable
class EmergencyCallStreamBloc
    extends Bloc<EmergencyCallStreamEvent, EmergencyCallStreamState> {
  StreamSubscription? _emergencyCallSubsription;
  final EmergencyCallRepositoryInterface emergencyCallRepository;

  EmergencyCallStreamBloc(
    this.emergencyCallRepository,
  ) : super(EmergencyCallStreamInitial()) {
    on<EmergencyCallStreamFetch>((event, emit) async {
      _emergencyCallSubsription?.cancel();
      try {
        emit(EmergencyCallStreamLoading());
        _emergencyCallSubsription = emergencyCallRepository
            .getEmergencyCallListStream()
            .listen((event) {
          add(EmergencyCallStreamUpdate(event));
        });
      } catch (e, s) {
        emit(EmergencyCallStreamFailed(e, s));
      }
    });

    on<EmergencyCallStreamUpdate>((event, emit) {
      emit(EmergencyCallStreamSuccess(event.data));
    });
  }

  @override
  Future<void> close() {
    _emergencyCallSubsription?.cancel();
    return super.close();
  }
}
