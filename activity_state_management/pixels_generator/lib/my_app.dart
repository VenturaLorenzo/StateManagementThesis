import 'package:activity_state_management/bloc/UI/bloc_navigator.dart';
import 'package:activity_state_management/home_page.dart';
import 'package:activity_state_management/inherited_widgets/UI/inherited_widgets_navigator.dart';
import 'package:activity_state_management/inherited_widgets/core/pixels_provider.dart';
import 'package:activity_state_management/mobx/UI/mobx_navigator.dart';
import 'package:activity_state_management/redux/UI/redux_navigator.dart';
import 'package:activity_state_management/redux/core/app_state.dart';
import 'package:activity_state_management/redux/core/app_state_reducer.dart';
import 'package:activity_state_management/setState/UI/setState_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import 'bloc/core/pixels_bloc.dart';
import 'mobx/core/store.dart';

const routeHome = '/';
const reduxPrefix = '/redux/';
const blocPrefix = '/bloc/';
const mobxPrefix = '/mobx/';
const setStatePrefix = '/setState/';
const inheritedWidgetsPrefix = '/inheritedWidgets/';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        late Widget page;
        if (settings.name == routeHome) {
          page = HomePage();
        } else if (settings.name!.startsWith(reduxPrefix)) {
          final subRoute = settings.name!.substring(reduxPrefix.length);
          page = StoreProvider(
              store: Store<AppState>(appStateReducer, initialState: AppState()),
              child: ReduxNavigator(setupPageRoute: subRoute));
        } else if (settings.name!.startsWith(blocPrefix)) {
          final subRoute = settings.name!.substring(blocPrefix.length);
          page = BlocProvider(
              create: (context) => PixelsBloc(),
              child: BlocNavigator(setupPageRoute: subRoute));
        } else if (settings.name!.startsWith(mobxPrefix)) {
          final subRoute = settings.name!.substring(mobxPrefix.length);
          page = Provider(
            create: (context) => PixelStore(),
            child: MobxNavigator(setupPageRoute: subRoute),
          );
        } else if (settings.name!.startsWith(setStatePrefix)) {
          final subRoute = settings.name!.substring(setStatePrefix.length);
          page = SetStateNavigator(setupPageRoute: subRoute);
        } else if (settings.name!.startsWith(inheritedWidgetsPrefix)) {
          final subRoute =
              settings.name!.substring(inheritedWidgetsPrefix.length);
          page = PixelsProvider(
              child: InheritedWidgetsNavigator(setupPageRoute: subRoute));
        } else {
          throw Exception('Unknown route: ${settings.name}');
        }

        return MaterialPageRoute<dynamic>(
          builder: (context) {
            return page;
          },
          settings: settings,
        );
      },
      debugShowCheckedModeBanner: false,

      /* routes: {
        "homepage":(_) => const HomePage(),
        "asyncHomepage": (_) => const AsyncHomePage(),
        "pixelsHomepage": (_) => const PixelsHomePage(),
        "reduxMultiConnector": (context) => StoreProvider(
              store: Store<AppState>(appStateReducer, initialState: AppState()),
              child: const MultiConnectorReduxHomePage(
                optimized: false,
              ),
            ),
        "reduxMultiConnectorOptimized": (context) => StoreProvider(
              store: Store<AppState>(appStateReducer, initialState: AppState()),
              child: const MultiConnectorReduxHomePage(
                optimized: true,
              ),
            ),
        "reduxSingleConnector": (context) => StoreProvider(
              store: Store<AppState>(appStateReducer, initialState: AppState()),
              child: const SingleConnectorReduxHomePage(),
            ),
        "mobx": (context) => Provider(
              create: (context) => PixelStore(),
              child: const MobXHomePage(),
            ),
        "setState": (context) => const SetStateHomePage(),
        "bloc": (context) => BlocProvider(
              create: (context) => PixelsBloc(),
              child: const PixelsPage(
                optimized: false,
              ),
            ),
        "blocOptimized": (context) => BlocProvider(
              create: (context) => PixelsBloc(),
              child: const PixelsPage(
                optimized: true,
              ),
            ),
        "inheritedWidgets": (context) =>
            const widgets.PixelsProvider(child: InheritedWidgetsHomePage()),
        "inheritedModels": (context) =>
            const models.PixelsProvider(child: PixelsHomePage()),
        "loading": (context) => LoadingPage(
            route: ModalRoute.of(context)!.settings.arguments as String),
        "fetch": (context) => const FetchPage(),
      },
      initialRoute: "homepage",*/
    );
  }
}
