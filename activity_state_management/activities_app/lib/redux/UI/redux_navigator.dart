import 'package:activity_state_management/my_app.dart';
import 'package:activity_state_management/redux/UI/pixels_activities/multi_connector/pixels_page.dart'
    as multi;
import 'package:activity_state_management/redux/UI/pixels_activities/single_connector/pixels_page.dart'
    as single;
import 'package:activity_state_management/redux/UI/redux_home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const routeReduxHome = '$reduxPrefix$routeReduxHomePage';
const routeReduxHomePage = 'home';
const routeReduxPixelsPageSingleConnector = 'pixelsSingleConnector';
const routeReduxPixelsPageMultiConnector = 'pixelsMultiConnector';
const routeReduxPixelsPageMultiConnectorOptimized =
    'pixelsMultiConnectorOptimized';
const routeReduxAsyncPage = 'async';

@immutable
class ReduxNavigator extends StatefulWidget {
  const ReduxNavigator({
    super.key,
    required this.setupPageRoute,
  });

  final String setupPageRoute;

  @override
  ReduxNavigatorState createState() => ReduxNavigatorState();
}

class ReduxNavigatorState extends State<ReduxNavigator> {
  final _navigatorKey = GlobalKey<NavigatorState>();

/*
  void _onGoToPixels() {
    _navigatorKey.currentState!.pushNamed();
  }*/
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
      case routeReduxHomePage:
        page = ReduxHomePage(
          exitSolution: _onExitPressed,
        );
        break;
      case routeReduxPixelsPageMultiConnector:
        page = const multi.PixelsPage(optimized: false);
        break;
      case routeReduxPixelsPageMultiConnectorOptimized:
        page = const multi.PixelsPage(optimized: true);
        break;
      case routeReduxPixelsPageSingleConnector:
        page = const single.PixelsPage();
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
