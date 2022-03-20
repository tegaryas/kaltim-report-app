import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';

import 'package:kaltim_report/modules/profile/models/profile_model.dart';
import 'package:kaltim_report/modules/profile/repositories/profile_repository_interface.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  StreamSubscription? _profileSubsription;
  final ProfileRepositoryInterface profileRepository;
  final FirebaseCrashlytics firebaseCrashlytics;
  ProfileBloc({
    required this.profileRepository,
    required this.firebaseCrashlytics,
  }) : super(ProfileInitial()) {
    on<ProfileFetching>((event, emit) {
      _profileSubsription?.cancel();
      try {
        emit(ProfileLoading());
        _profileSubsription =
            profileRepository.getCurrentUserData().listen((event) {
          add(ProfileUpdate(profile: event));
        });
      } catch (e, s) {
        firebaseCrashlytics.recordError(e, s);
        emit(ProfileFailed());
      }
    });

    on<ProfileUpdate>((event, emit) {
      emit(ProfileLoaded(profile: event.profile));
    });
  }

  @override
  Future<void> close() {
    _profileSubsription?.cancel();
    return super.close();
  }
}
