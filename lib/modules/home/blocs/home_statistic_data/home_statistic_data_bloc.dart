import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/home/models/statistic_model.dart';
import 'package:kaltim_report/modules/home/repositories/home_repository_interface.dart';

part 'home_statistic_data_event.dart';
part 'home_statistic_data_state.dart';

@injectable
class HomeStatisticDataBloc
    extends Bloc<HomeStatisticDataEvent, HomeStatisticDataState> {
  final HomeRepositoryInterface homeRepository;

  HomeStatisticDataBloc(
    this.homeRepository,
  ) : super(HomeStatisticDataInitial()) {
    on<HomeStatisticDataFetch>((event, emit) async {
      try {
        emit(HomeStatisticDataLoading());
        final res = await homeRepository.getReportStatisticByStatus();
        emit(HomeStatisticDataSuccess(data: res));
      } catch (e, s) {
        emit(HomeStatisticDataFailed(e, s));
      }
    });
  }
}
