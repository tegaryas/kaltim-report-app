import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/gempa_bumi/models/gempa_bumi_model.dart';
import 'package:kaltim_report/modules/gempa_bumi/repositories/gempa_bumi_repository_interface.dart';

part 'gempa_bumi_last_recently_event.dart';
part 'gempa_bumi_last_recently_state.dart';

@injectable
class GempaBumiLastRecentlyBloc
    extends Bloc<GempaBumiLastRecentlyEvent, GempaBumiLastRecentlyState> {
  final GempaBumiRepositoryInterface gempaBumiRepository;

  GempaBumiLastRecentlyBloc(
    this.gempaBumiRepository,
  ) : super(GempaBumiLastRecentlyInitial()) {
    on<GempaBumiLastRecentlyFetch>((event, emit) async {
      try {
        emit(GempaBumiLastRecentlyLoading());
        final res = await gempaBumiRepository.getAllEarthQuake();
        emit(GempaBumiLastRecentlySuccess(data: res));
      } catch (e, s) {
        emit(GempaBumiLastRecentlyFailed(e, s));
      }
    });
  }
}
