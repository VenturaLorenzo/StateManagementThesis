import 'package:flutter/material.dart';
import 'bloc_home_page.dart';
import 'pixels_activities/pixels_page.dart';

const routeBlocHome = '/bloc/$routeBlocHomePage';
const routeBlocHomePage = 'home';
const routeBlocPixelsPage = 'pixels';
const routeBlocPixelsOptimizedPage = 'pixelsOptimized';
const routeBlocAsyncPage = 'async';

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

  void _onGoToPixels() {
    _navigatorKey.currentState!.pushNamed(routeBlocPixelsPage);
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
      case routeBlocHomePage:
        page = BlocHomePage(
          exitSolution: _onExitPressed,
        );
        break;
      case routeBlocPixelsPage:
        page = const PixelsPage(optimized: false);
        break;
      case routeBlocPixelsOptimizedPage:
        page = const PixelsPage(optimized: true);
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
