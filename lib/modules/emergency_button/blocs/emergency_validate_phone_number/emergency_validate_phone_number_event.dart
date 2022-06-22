part of 'emergency_validate_phone_number_bloc.dart';

abstract class EmergencyValidatePhoneNumberEvent extends Equatable {
  const EmergencyValidatePhoneNumberEvent();

  @override
  List<Object> get props => [];
}

class EmergencyValidatePhoneNumberCheck
    extends EmergencyValidatePhoneNumberEvent {}
