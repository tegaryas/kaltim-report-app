import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/home/models/covid_feature_model.dart';
import 'package:kaltim_report/modules/home/repositories/home_repository_interface.dart';

part 'home_covid_event.dart';
part 'home_covid_state.dart';

@injectable
class HomeCovidBloc extends Bloc<HomeCovidEvent, HomeCovidState> {
  final HomeRepositoryInterface homeRepository;

  HomeCovidBloc(
    this.homeRepository,
  ) : super(HomeCovidInitial()) {
    on<HomeCovidFetch>((event, emit) async {
      try {
        emit(HomeCovidLoading());
        final res = await homeRepository.getCovidFeature();
        emit(HomeCovidSuccess(config: res));
      } catch (e, s) {
        emit(HomeCovidFailed(e, s));
      }
    });
  }
}
