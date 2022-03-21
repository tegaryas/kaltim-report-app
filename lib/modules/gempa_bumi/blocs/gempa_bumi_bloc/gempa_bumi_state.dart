part of 'gempa_bumi_bloc.dart';

abstract class GempaBumiState extends Equatable {
  const GempaBumiState();

  @override
  List<Object> get props => [];
}

class GempaBumiInitial extends GempaBumiState {}

class GempaBumiLoading extends GempaBumiState {}

class GempaBumiFailed extends GempaBumiState {
  final Object e;
  final StackTrace s;

  const GempaBumiFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class GempaBumiSuccess extends GempaBumiState {
  final GempaBumiModel data;

  const GempaBumiSuccess({required this.data});

  @override
  List<Object> get props => [data];
}
