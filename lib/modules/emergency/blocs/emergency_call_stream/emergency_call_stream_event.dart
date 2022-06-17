part of 'emergency_call_stream_bloc.dart';

abstract class EmergencyCallStreamEvent extends Equatable {
  const EmergencyCallStreamEvent();

  @override
  List<Object> get props => [];
}

class EmergencyCallStreamFetch extends EmergencyCallStreamEvent {}

class EmergencyCallStreamUpdate extends EmergencyCallStreamEvent {
  final List<EmergencyCallModel> data;

  const EmergencyCallStreamUpdate(this.data);

  @override
  List<Object> get props => [data];
}
