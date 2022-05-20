import 'package:activity_state_management/setState/UI/pixels_activities/pixels_page.dart';
import 'package:activity_state_management/setState/UI/setState_home_page.dart';
import 'package:flutter/material.dart';

import '../../my_app.dart';

const routeSetStateHome = '$setStatePrefix$routeSetStateHomePage';
const routeSetStateHomePage = 'home';
const routeSetStatePixelsPage = 'pixels';
const routeSetStatePixelsOptimizedPage = 'pixelsOptimized';
const routeSetStateAsyncPage = 'async';

@immutable
class SetStateNavigator extends StatefulWidget {
  const SetStateNavigator({
    super.key,
    required this.setupPageRoute,
  });

  final String setupPageRoute;

  @override
  SetStateNavigatorState createState() => SetStateNavigatorState();
}

class SetStateNavigatorState extends State<SetStateNavigator> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  void _onGoToPixels() {
    _navigatorKey.currentState!.pushNamed(routeSetStatePixelsPage);
  }

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
      case routeSetStateHomePage:
        page = SetStateHomePage(
          exitSolution: _onExitPressed,
        );
        break;
      case routeSetStatePixelsPage:
        page = const PixelsPage();
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
