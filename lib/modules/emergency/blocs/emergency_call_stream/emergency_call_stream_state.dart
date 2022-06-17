part of 'emergency_call_stream_bloc.dart';

abstract class EmergencyCallStreamState extends Equatable {
  const EmergencyCallStreamState();

  @override
  List<Object> get props => [];
}

class EmergencyCallStreamInitial extends EmergencyCallStreamState {}

class EmergencyCallStreamLoading extends EmergencyCallStreamState {}

class EmergencyCallStreamFailed extends EmergencyCallStreamState {
  final Object e;
  final StackTrace s;

  const EmergencyCallStreamFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class EmergencyCallStreamSuccess extends EmergencyCallStreamState {
  final List<EmergencyCallModel> data;

  const EmergencyCallStreamSuccess(this.data);

  @override
  List<Object> get props => [data];
}
