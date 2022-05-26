import 'package:activity_state_management/activity.dart';
import 'package:activity_state_management/bloc/core/user/user_bloc.dart';
import 'package:activity_state_management/bloc/core/user/user_event.dart';
import 'package:activity_state_management/bloc/core/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../user.dart';
import '../bloc_navigator.dart';

class BlocHomePage extends StatefulWidget {
  final VoidCallback exitSolution;

  const BlocHomePage({Key? key, required this.exitSolution}) : super(key: key);

  @override
  State<BlocHomePage> createState() => _BlocHomePageState();
}

class _BlocHomePageState extends State<BlocHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _createAppBar(context),
        body: BlocListener<UserBloc, UserState>(
            listenWhen: (old, current) {
              return (old is LoggedOut && current is LoggedIn);
            },
            listener: (context, state) {
              _showSnackBar((state as LoggedIn).user.username);
            },
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Activity(
                          route: routeBlocPixelsPage, color: Colors.blueAccent),
                      Activity(
                          route: routeBlocAsyncPage, color: Colors.blueAccent),
                      Activity(
                          route: routeBlocPixelsOptimizedPage,
                          color: Colors.blueAccent)
                    ],
                  ),
                ),
              ),
            )));
  }

  AppBar _createAppBar(BuildContext context) {
    return AppBar(
        leading: IconButton(
          onPressed: widget.exitSolution,
          icon: const Icon(Icons.chevron_left),
        ),
        actions: [
          BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            if (state is LoggedIn) {
              return _createAccountToolbar(state.user, context);
            } else if (state is LoggedOut) {
              return IconButton(
                icon: const Icon(Icons.account_circle_outlined),
                onPressed: () {
                  Navigator.pushNamed(context, routeBlocLoginPage);
                },
              );
            } else {
              return const Text("error");
            }
          }),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, routeBlocSettingsPage);
            },
          ),
        ],
        title: const Text("Bloc home"));
  }

  void _showSnackBar(String username) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.greenAccent,
      content: Text("Welcome user: $username"),
      action: SnackBarAction(
        label: 'Logout',
        onPressed: () {
          BlocProvider.of<UserBloc>(context).add(LogoutRequest());
        },
      ),
    ));
  }
}

Row _createAccountToolbar(User user, BuildContext context) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
            child: Container(
                color: Colors.redAccent,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("logout"),
                )),
            onTap: () {
              BlocProvider.of<UserBloc>(context).add(LogoutRequest());
            }),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('user');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(user.username),
              const Icon(Icons.account_circle),
            ],
          ),
        ),
      ),
    ],
  );
}
