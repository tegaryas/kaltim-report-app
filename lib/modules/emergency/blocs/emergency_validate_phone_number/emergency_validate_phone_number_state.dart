part of 'emergency_validate_phone_number_bloc.dart';

abstract class EmergencyValidatePhoneNumberState extends Equatable {
  const EmergencyValidatePhoneNumberState();

  @override
  List<Object> get props => [];
}

class EmergencyValidatePhoneNumberInitial
    extends EmergencyValidatePhoneNumberState {}

class EmergencyValidatePhoneNumberLoading
    extends EmergencyValidatePhoneNumberState {}

class EmergencyValidatePhoneNumberFailed
    extends EmergencyValidatePhoneNumberState {
  final Object e;
  final StackTrace s;

  const EmergencyValidatePhoneNumberFailed(this.e, this.s);

  @override
  List<Object> get props => [e, s];
}

class EmergencyValidatePhoneNumberExist
    extends EmergencyValidatePhoneNumberState {
  final String phoneNumber;

  const EmergencyValidatePhoneNumberExist(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class EmergencyValidatePhoneNumberNotExist
    extends EmergencyValidatePhoneNumberState {}
