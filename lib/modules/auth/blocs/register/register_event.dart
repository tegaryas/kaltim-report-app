part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object?> get props => [];
}

class RegisterStarted extends RegisterEvent {
  final String email;

  const RegisterStarted({
    required this.email,
  });

  @override
  List<Object?> get props => [
        email,
      ];
}

class RegisterCompleteData extends RegisterEvent {
  final RegisterModel data;

  const RegisterCompleteData({required this.data});
  @override
  List<Object> get props => [data];
}
