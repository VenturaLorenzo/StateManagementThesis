import 'package:equatable/equatable.dart';

class User extends Equatable{
  final int id;
  final String username;
  final String email;
  final DateTime signInDate;

  User({required this.username, required this.email, required this.id, required this.signInDate});

  @override
  List<Object?> get props => [id, username,email, signInDate];

}