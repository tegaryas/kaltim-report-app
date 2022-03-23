part of 'gempa_bumi_magnetudo_bloc.dart';

abstract class GempaBumiMagnetudoEvent extends Equatable {
  const GempaBumiMagnetudoEvent();

  @override
  List<Object> get props => [];
}

class GempaBumiMagnetudoFetch extends GempaBumiMagnetudoEvent {}
