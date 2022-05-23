import 'package:equatable/equatable.dart';

import '../../../user.dart';

abstract class UserState extends Equatable {}

class LoggedOut extends UserState {
  @override
  // TODO: implement props
  List<Object?> get props => [];


}

class LoggedIn extends UserState {
  final User user;

  LoggedIn({required this.user});
  @override
  List<Object?> get props => [user];
}