part of 'profile_edit_bloc.dart';

abstract class ProfileEditState extends Equatable {
  const ProfileEditState();

  @override
  List<Object> get props => [];
}

class ProfileEditInitial extends ProfileEditState {}

class ProfileEditLoading extends ProfileEditState {}

class ProfileEditLoaded extends ProfileEditState {
  final ProfileFormModel data;

  const ProfileEditLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class ProfileEditFailed extends ProfileEditState {}
