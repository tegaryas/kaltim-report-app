part of 'gempa_bumi_magnetudo_bloc.dart';

abstract class GempaBumiMagnetudoState extends Equatable {
  const GempaBumiMagnetudoState();

  @override
  List<Object> get props => [];
}

class GempaBumiMagnetudoInitial extends GempaBumiMagnetudoState {}

class GempaBumiMagnetudoLoading extends GempaBumiMagnetudoState {}

class GempaBumiMagnetudoFailed extends GempaBumiMagnetudoState {
  final Object e;
  final StackTrace s;

  const GempaBumiMagnetudoFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class GempaBumiMagnetudoSuccess extends GempaBumiMagnetudoState {
  final List<GempaBumiModel> data;

  const GempaBumiMagnetudoSuccess({required this.data});

  @override
  List<Object> get props => [data];
}
