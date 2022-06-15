part of 'emergency_call_bloc.dart';

abstract class EmergencyCallEvent extends Equatable {
  const EmergencyCallEvent();

  @override
  List<Object> get props => [];
}

class EmergencyCallSendForm extends EmergencyCallEvent {
  final EmergencyCallFormModel data;

  const EmergencyCallSendForm({required this.data});

  @override
  List<Object> get props => [];
}
