part of 'emergency_call_bloc.dart';

abstract class EmergencyCallState extends Equatable {
  const EmergencyCallState();

  @override
  List<Object> get props => [];
}

class EmergencyCallInitial extends EmergencyCallState {}

class EmergencyCallLoading extends EmergencyCallState {}

class EmergencyCallFailed extends EmergencyCallState {
  final Object e;
  final StackTrace s;

  const EmergencyCallFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class EmergencyCallSuccess extends EmergencyCallState {}
