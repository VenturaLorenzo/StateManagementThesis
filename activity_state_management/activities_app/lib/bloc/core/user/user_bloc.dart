import 'package:activity_state_management/bloc/core/user/user_event.dart';
import 'package:activity_state_management/bloc/core/user/user_state.dart';
import 'package:activity_state_management/sign_in_response.dart';
import 'package:bloc/bloc.dart';

import '../../../user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(LoggedOut());

  get yield => null;

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {

    if (event is LogoutRequest) {
      yield LoggedOut();
    } else if (event is LoginRequest) {
      yield* _mapLoginRequestToState(event);
    } else if (event is SignInRequest) {
      yield* _mapSignInRequestToState(event);
    }
  }

  Stream<UserState> _mapLoginRequestToState(LoginRequest event) async* {
    if (state is LoggedIn) {
      print("already logged in");
      yield state;
    } else if (state is LoggedOut) {
      User? user = checkCredentials(event.username, event.password);
      if (user != null) {
        yield LoggedIn(user: user);
      }
    } else {
      yield state;
    }
  }

  Stream<UserState> _mapSignInRequestToState(SignInRequest event) async* {
    if(state is LoggedIn){
      yield state;
    }else {
      SignInResponse response =
      signInUser(event.email, event.username, event.password);
      if (response.completed) {
        yield LoggedIn(user: response.user);
      } else {
        state;
      }
    }
  }

  User? checkCredentials(String username, String password) {
    return User(
        email: "prova@gmail.com",
        id: 21,
        signInDate: DateTime(1999, 33),
        username: "prov");
  }

  SignInResponse signInUser(String email, String username, String password) {
    User user = User(
        email: "prova@gmail.com",
        id: 21,
        signInDate: DateTime(1999, 33),
        username: "prov");
    return SignInResponse(error: "", completed: true, user: user);
  }
}
