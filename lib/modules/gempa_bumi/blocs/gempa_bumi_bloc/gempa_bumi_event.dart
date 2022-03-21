part of 'gempa_bumi_bloc.dart';

abstract class GempaBumiEvent extends Equatable {
  const GempaBumiEvent();

  @override
  List<Object> get props => [];
}

class GempaBumiFetch extends GempaBumiEvent {}
