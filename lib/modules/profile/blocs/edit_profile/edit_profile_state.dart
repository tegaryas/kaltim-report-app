part of 'edit_profile_bloc.dart';

abstract class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object> get props => [];
}

class EditProfileInitial extends EditProfileState {}

class EditProfileLoading extends EditProfileState {}

class EditProfileLoaded extends EditProfileState {
  final ProfileModel data;

  const EditProfileLoaded({required this.data});

  @override
  List<Object> get props => [data];
}

class EditProfileFailed extends EditProfileState {}
