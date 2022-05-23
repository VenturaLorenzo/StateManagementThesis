import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {}

class LoginRequest extends UserEvent {
  final String username;
  final String password;

  LoginRequest({required this.username, required this.password});
  @override
  List<Object?> get props => [username, password];
}

class LogoutRequest extends UserEvent {

  @override
  List<Object?> get props => [];
}

class SignInRequest extends UserEvent {
  final String username;
  final String password;
  final String email;

  SignInRequest({required this.password, required this.username, required this.email});
  @override
  List<Object?> get props => [username, password, email];
}