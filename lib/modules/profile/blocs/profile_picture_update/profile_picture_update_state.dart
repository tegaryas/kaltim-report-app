part of 'profile_picture_update_bloc.dart';

abstract class ProfilePictureUpdateState extends Equatable {
  const ProfilePictureUpdateState();

  @override
  List<Object> get props => [];
}

class ProfilePictureUpdateInitial extends ProfilePictureUpdateState {}

class ProfilePictureUpdateLoading extends ProfilePictureUpdateState {}

class ProfilePictureUpdateFailed extends ProfilePictureUpdateState {
  final Object e;
  final StackTrace s;

  const ProfilePictureUpdateFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class ProfilePictureUpdateSuccess extends ProfilePictureUpdateState {}
