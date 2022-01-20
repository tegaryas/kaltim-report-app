part of 'feature_bloc.dart';

abstract class FeatureEvent extends Equatable {
  const FeatureEvent();

  @override
  List<Object> get props => [];
}

class FeatureFetching extends FeatureEvent {}

class FeatureUpdate extends FeatureEvent {
  final List<FeatureModel> feature;

  const FeatureUpdate({required this.feature});

  @override
  List<Object> get props => [feature];
}
