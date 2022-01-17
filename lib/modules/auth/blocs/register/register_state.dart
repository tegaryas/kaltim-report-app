part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterUser extends RegisterState {
  final String email;
  const RegisterUser({required this.email});
  @override
  List<Object?> get props => [email];
}

class RegisterAlreadyRegistered extends RegisterState {
  final String email;
  const RegisterAlreadyRegistered({required this.email});
  @override
  List<Object?> get props => [email];
}

class RegisterFailed extends RegisterState {
  final Object error;
  final StackTrace? stackTrace;
  const RegisterFailed({required this.error, this.stackTrace});

  @override
  List<Object?> get props => [error, stackTrace];
}
