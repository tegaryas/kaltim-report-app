part of 'profile_edit_bloc.dart';

abstract class ProfileEditEvent extends Equatable {
  const ProfileEditEvent();

  @override
  List<Object> get props => [];
}

class ProfileUpdateFormData extends ProfileEditEvent {
  final ProfileFormModel data;

  const ProfileUpdateFormData({required this.data});

  @override
  List<Object> get props => [data];
}
