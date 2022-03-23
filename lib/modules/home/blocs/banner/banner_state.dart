part of 'banner_bloc.dart';

abstract class BannerState extends Equatable {
  const BannerState();

  @override
  List<Object> get props => [];
}

class BannerInitial extends BannerState {}

class BannerLoading extends BannerState {}

class BannerFailed extends BannerState {
  final Object e;
  final StackTrace s;

  const BannerFailed(this.e, this.s);

  @override
  List<Object> get props => [];
}

class BannerSuccess extends BannerState {
  final List<BannerModel> data;

  const BannerSuccess({required this.data});
  @override
  List<Object> get props => [];
}
