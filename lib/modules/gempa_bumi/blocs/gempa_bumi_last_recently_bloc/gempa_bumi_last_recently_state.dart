part of 'gempa_bumi_last_recently_bloc.dart';

abstract class GempaBumiLastRecentlyState extends Equatable {
  const GempaBumiLastRecentlyState();

  @override
  List<Object> get props => [];
}

class GempaBumiLastRecentlyInitial extends GempaBumiLastRecentlyState {}

class GempaBumiLastRecentlyLoading extends GempaBumiLastRecentlyState {}

class GempaBumiLastRecentlyFailed extends GempaBumiLastRecentlyState {
  final Object e;
  final StackTrace s;

  const GempaBumiLastRecentlyFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class GempaBumiLastRecentlySuccess extends GempaBumiLastRecentlyState {
  final List<GempaBumiModel> data;

  const GempaBumiLastRecentlySuccess({required this.data});

  @override
  List<Object> get props => [data];
}
