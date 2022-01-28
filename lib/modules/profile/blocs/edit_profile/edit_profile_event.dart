part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileUpdateFormData extends EditProfileEvent {
  final ProfileFormModel data;

  const ProfileUpdateFormData({required this.data});

  @override
  List<Object> get props => [data];
}
