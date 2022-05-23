import 'package:activity_state_management/user.dart';

class SignInResponse{
  final String error;
  final bool completed;
  final User user;
  SignInResponse({required this.error, required this.completed, required this.user});
}