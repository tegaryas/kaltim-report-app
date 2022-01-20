import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/home/models/feature_model.dart';
import 'package:kaltim_report/modules/home/providers/home_provider_interface.dart';

part 'feature_event.dart';
part 'feature_state.dart';

@injectable
class FeatureBloc extends Bloc<FeatureEvent, FeatureState> {
  StreamSubscription? _featureSubsription;
  final HomeProviderInterface homeRepository;
  FeatureBloc({required this.homeRepository}) : super(FeatureInitial()) {
    on<FeatureEvent>((event, emit) {
      if (event is FeatureFetching) {
        _featureSubsription?.cancel();
        try {
          emit(FeatureLoading());
          homeRepository.getFeatureList().listen((event) {
            add(FeatureUpdate(feature: event));
          });
        } catch (e) {
          emit(FeatureFailed());
        }
      }
      if (event is FeatureUpdate) {
        emit(FeatureLoaded(feature: event.feature));
      }
    });
  }

  @override
  Future<void> close() {
    _featureSubsription?.cancel();
    return super.close();
  }
}
