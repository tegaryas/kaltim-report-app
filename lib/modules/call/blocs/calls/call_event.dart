part of 'call_bloc.dart';

abstract class CallEvent extends Equatable {
  const CallEvent();

  @override
  List<Object> get props => [];
}

class EmergencyCallFetching extends CallEvent {}

class EmergencyCallUpdate extends CallEvent {
  final List<EmergencyCallModel> calls;

  const EmergencyCallUpdate({required this.calls});

  @override
  List<Object> get props => [calls];
}
