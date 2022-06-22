import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/home/models/banner_model.dart';
import 'package:kaltim_report/modules/home/repositories/home_repository_interface.dart';

part 'banner_event.dart';
part 'banner_state.dart';

@injectable
class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final HomeRepositoryInterface homeRepository;

  BannerBloc(
    this.homeRepository,
  ) : super(BannerInitial()) {
    on<BannerFetch>((event, emit) async {
      try {
        emit(BannerLoading());
        final res = await homeRepository.getBanner();
        emit(BannerSuccess(data: res));
      } catch (e, s) {
        emit(BannerFailed(e, s));
      }
    });
  }
}
