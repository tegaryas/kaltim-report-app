part of 'emergency_call_bloc.dart';

abstract class EmergencyCallEvent extends Equatable {
  const EmergencyCallEvent();

  @override
  List<Object> get props => [];
}

class EmergencyCallSendFrom extends EmergencyCallEvent {
  final EmergencyCallFormModel data;

  const EmergencyCallSendFrom({required this.data});

  @override
  List<Object> get props => [];
}
