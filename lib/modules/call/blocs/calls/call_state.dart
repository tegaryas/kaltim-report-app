part of 'call_bloc.dart';

abstract class CallState extends Equatable {
  const CallState();

  @override
  List<Object> get props => [];
}

class CallInitial extends CallState {}

class CallLoading extends CallState {}

class CallLoaded extends CallState {
  final List<EmergencyCallModel> calls;

  const CallLoaded({
    required this.calls,
  });

  @override
  List<Object> get props => [calls];
}

class CallFailed extends CallState {}
