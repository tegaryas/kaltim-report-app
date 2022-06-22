part of 'emergency_call_list_bloc.dart';

abstract class EmergencyCallListEvent extends Equatable {
  const EmergencyCallListEvent();

  @override
  List<Object> get props => [];
}

class EmergencyCallListFetch extends EmergencyCallListEvent {}

class EmergencyCallListRemoveById extends EmergencyCallListEvent {
  final String id;

  const EmergencyCallListRemoveById({required this.id});

  @override
  List<Object> get props => [id];
}
