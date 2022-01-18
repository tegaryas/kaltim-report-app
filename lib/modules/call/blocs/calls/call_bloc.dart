import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/call/models/emergency_call_model.dart';
import 'package:kaltim_report/modules/call/repositories/call_repository_interface.dart';

part 'call_event.dart';
part 'call_state.dart';

@injectable
class CallBloc extends Bloc<CallEvent, CallState> {
  final CallRepositoryInterface callRepository;

  CallBloc({required this.callRepository}) : super(CallInitial()) {
    on<CallEvent>((event, emit) {
      if (event is EmergencyCallFetching) {
        // _reportSubsription?.cancel();
        try {
          emit(CallLoading());
          callRepository.getEmergencyCallList().listen((event) {
            add(EmergencyCallUpdate(calls: event));
          });
        } catch (e) {
          emit(CallFailed());
        }
      }
      if (event is EmergencyCallUpdate) {
        emit(CallLoaded(calls: event.calls));
      }
    });
  }
}
