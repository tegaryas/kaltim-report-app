part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileFetching extends ProfileEvent {}

class ProfileUpdate extends ProfileEvent {
  final ProfileModel profile;

  const ProfileUpdate({required this.profile});

  @override
  List<Object> get props => [profile];
}
