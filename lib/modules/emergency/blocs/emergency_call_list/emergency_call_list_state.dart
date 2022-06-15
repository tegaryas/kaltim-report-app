part of 'emergency_call_list_bloc.dart';

abstract class EmergencyCallListState extends Equatable {
  const EmergencyCallListState();

  @override
  List<Object> get props => [];
}

class EmergencyCallListInitial extends EmergencyCallListState {}

class EmergencyCallListLoading extends EmergencyCallListState {}

class EmergencyCallListFailed extends EmergencyCallListState {
  final Object e;
  final StackTrace s;

  const EmergencyCallListFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class EmergencyCallListSuccess extends EmergencyCallListState {
  final List<EmergencyCallModel> data;

  const EmergencyCallListSuccess({required this.data});

  @override
  List<Object> get props => [data];
}
