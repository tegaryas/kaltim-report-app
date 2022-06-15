part of 'profile_picture_update_bloc.dart';

abstract class ProfilePictureUpdateEvent extends Equatable {
  const ProfilePictureUpdateEvent();

  @override
  List<Object?> get props => [];
}

class ProfilePictureUpdateAdd extends ProfilePictureUpdateEvent {
  final XFile? image;

  const ProfilePictureUpdateAdd({this.image});

  @override
  List<Object?> get props => [image];
}
