import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/gempa_bumi/models/gempa_bumi_model.dart';
import 'package:kaltim_report/modules/gempa_bumi/repositories/gempa_bumi_repository_interface.dart';

part 'gempa_bumi_event.dart';
part 'gempa_bumi_state.dart';

@injectable
class GempaBumiBloc extends Bloc<GempaBumiEvent, GempaBumiState> {
  final GempaBumiRepositoryInterface gempaBumiRepository;

  GempaBumiBloc(
    this.gempaBumiRepository,
  ) : super(GempaBumiInitial()) {
    on<GempaBumiFetch>((event, emit) async {
      try {
        emit(GempaBumiLoading());
        final res = await gempaBumiRepository.getCurrentEarthQuake();
        emit(GempaBumiSuccess(data: res));
      } catch (e, s) {
        emit(GempaBumiFailed(e, s));
      }
    });
  }
}
