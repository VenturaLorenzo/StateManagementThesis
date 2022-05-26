import 'package:activity_state_management/bloc/UI/home/bloc_navigator.dart';
import 'package:activity_state_management/bloc/core/user/user_bloc.dart';
import 'package:activity_state_management/bloc/core/user/user_event.dart';
import 'package:activity_state_management/bloc/core/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  initState() {
    super.initState();
    usernameController.text = "username";
    passwordController.text = "password";
    if(BlocProvider.of<UserBloc>(context).state is LoggedIn){
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc,UserState>(
      builder: (context,state) {
        if (state is LoggedOut) {
          return Scaffold(
            appBar: AppBar(title: const Text("Login page")),
            body: Center(
              child: SizedBox(width: MediaQuery.of(context).size.width*0.7,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Insert your credentials"),
                    TextField(
                      maxLength: 10,
                      controller: usernameController,
                    ),
                    TextField(
                      maxLength: 10,
                      controller: passwordController,
                    ),
                    TextButton(onPressed: () {
                      BlocProvider.of<UserBloc>(context).add(LoginRequest(
                          username: usernameController.text,
                          password: passwordController.text));
                    }, child: Text("Login")),
                  ],
                ),
              ),
            ),
          );
        }else{
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pop();
          });
          return Container();
        }
      }
    );
  }
}
