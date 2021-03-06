import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/home/models/statistic_model.dart';
import 'package:kaltim_report/modules/home/repositories/home_repository_interface.dart';

part 'home_statistic_chart_event.dart';
part 'home_statistic_chart_state.dart';

@injectable
class HomeStatisticChartBloc
    extends Bloc<HomeStatisticChartEvent, HomeStatisticChartState> {
  final HomeRepositoryInterface homeRepository;

  HomeStatisticChartBloc(
    this.homeRepository,
  ) : super(HomeStatisticChartInitial()) {
    on<HomeStatisticChartFetch>((event, emit) async {
      try {
        emit(HomeStatisticChartLoading());
        final res = await homeRepository.getReportStatistic();
        emit(HomeStatisticChartSuccess(data: res));
      } catch (e, s) {
        emit(HomeStatisticChartFailed(e, s));
      }
    });
  }
}
