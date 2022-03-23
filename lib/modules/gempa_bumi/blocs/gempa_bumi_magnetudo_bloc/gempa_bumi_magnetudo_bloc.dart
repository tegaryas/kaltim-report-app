import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/gempa_bumi/models/gempa_bumi_model.dart';
import 'package:kaltim_report/modules/gempa_bumi/repositories/gempa_bumi_repository_interface.dart';

part 'gempa_bumi_magnetudo_event.dart';
part 'gempa_bumi_magnetudo_state.dart';

@injectable
class GempaBumiMagnetudoBloc
    extends Bloc<GempaBumiMagnetudoEvent, GempaBumiMagnetudoState> {
  final GempaBumiRepositoryInterface gempaBumiRepository;
  final FirebaseCrashlytics firebaseCrashlytics;
  GempaBumiMagnetudoBloc(this.gempaBumiRepository, this.firebaseCrashlytics)
      : super(GempaBumiMagnetudoInitial()) {
    on<GempaBumiMagnetudoFetch>((event, emit) async {
      try {
        emit(GempaBumiMagnetudoLoading());
        final res = await gempaBumiRepository.getLastDayEarthQuake();
        emit(GempaBumiMagnetudoSuccess(data: res));
      } catch (e, s) {
        firebaseCrashlytics.recordError(e, s);
        emit(GempaBumiMagnetudoFailed(e, s));
      }
    });
  }
}
