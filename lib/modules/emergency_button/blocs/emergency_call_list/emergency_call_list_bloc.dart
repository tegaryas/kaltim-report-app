import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/emergency_button/models/emergency_call_model.dart';
import 'package:kaltim_report/modules/emergency_button/repositories/emergency_call_repository_interface.dart';

part 'emergency_call_list_event.dart';
part 'emergency_call_list_state.dart';

@injectable
class EmergencyCallListBloc
    extends Bloc<EmergencyCallListEvent, EmergencyCallListState> {
  final EmergencyCallRepositoryInterface emergencyCallRepository;

  EmergencyCallListBloc(
    this.emergencyCallRepository,
  ) : super(EmergencyCallListInitial()) {
    on<EmergencyCallListFetch>((event, emit) async {
      try {
        emit(EmergencyCallListLoading());
        final res = await emergencyCallRepository.getEmergencyCallList();
        emit(EmergencyCallListSuccess(data: res));
      } catch (e, s) {
        emit(EmergencyCallListFailed(e, s));
      }
    });

    on<EmergencyCallListRemoveById>((event, emit) async {
      await emergencyCallRepository.removeUserEmergencyCall(event.id);
    });
  }
}
