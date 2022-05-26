import 'package:activity_state_management/bloc/UI/async_activities/async_page.dart';
import 'package:activity_state_management/bloc/UI/home/pages/settings.dart';
import 'pages/user_page.dart';
import 'package:activity_state_management/my_app.dart';
import 'package:flutter/material.dart';
import 'pages/bloc_home_page.dart';
import 'pages/login_page.dart';
import '../pixels_activities/pixels_page.dart';

const routeBlocHome = '$blocPrefix$routeBlocHomePage';
const routeBlocHomePage = 'home';
const routeBlocPixelsPage = 'pixels';
const routeBlocPixelsOptimizedPage = 'pixelsOptimized';
const routeBlocAsyncPage = 'async';
const routeBlocSettingsPage = 'settings';
const routeBlocLoginPage= 'login';
const routeBlocUserPage= 'user';

@immutable
class BlocNavigator extends StatefulWidget {
  const BlocNavigator({
    super.key,
    required this.setupPageRoute,
  });

  final String setupPageRoute;

  @override
  BlocNavigatorState createState() => BlocNavigatorState();
}

class BlocNavigatorState extends State<BlocNavigator> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _isExitDesired,
      child: Navigator(
        key: _navigatorKey,
        initialRoute: widget.setupPageRoute,
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case routeBlocHomePage:
        page = BlocHomePage(
          exitSolution: _onExitPressed,
        );
        break;
      case routeBlocPixelsPage:
        page = const PixelsPage(optimized: false);
        break;
      case routeBlocSettingsPage:
        page = const SettingsPage();
        break;
      case routeBlocLoginPage:
        page = const LoginPage();
        break;
      case routeBlocPixelsOptimizedPage:
        page = const PixelsPage(optimized: true);
        break;
      case routeBlocUserPage:
        page = const UserPage();
        break;
      case routeBlocAsyncPage:
        page =  AsyncPage();
        break;
      default:
        throw Exception('Unknown route: ${settings.name}');
    }

    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return page;
      },
      settings: settings,
    );
  }

  Future<void> _onExitPressed() async {
    final isConfirmed = await _isExitDesired();

    if (isConfirmed && mounted) {
      _exitSetup();
    }
  }

  Future<bool> _isExitDesired() async {
    return await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('If you exit your progress will be lost.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: const Text('Leave'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('Stay'),
                  ),
                ],
              );
            }) ??
        false;
  }

  void _exitSetup() {
    Navigator.of(context).pop();
  }

  PreferredSizeWidget _buildFlowAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: _onExitPressed,
        icon: const Icon(Icons.chevron_left),
      ),
      title: const Text('Bulb Setup'),
    );
  }
}
