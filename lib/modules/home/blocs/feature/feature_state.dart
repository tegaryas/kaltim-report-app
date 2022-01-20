part of 'feature_bloc.dart';

abstract class FeatureState extends Equatable {
  const FeatureState();

  @override
  List<Object> get props => [];
}

class FeatureInitial extends FeatureState {}

class FeatureLoading extends FeatureState {}

class FeatureLoaded extends FeatureState {
  final List<FeatureModel> feature;

  const FeatureLoaded({
    required this.feature,
  });

  @override
  List<Object> get props => [feature];
}

class FeatureFailed extends FeatureState {}
