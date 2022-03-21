part of 'gempa_bumi_last_recently_bloc.dart';

abstract class GempaBumiLastRecentlyEvent extends Equatable {
  const GempaBumiLastRecentlyEvent();

  @override
  List<Object> get props => [];
}

class GempaBumiLastRecentlyFetch extends GempaBumiLastRecentlyEvent {}
