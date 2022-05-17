import 'package:activity_state_management/bloc/UI/bloc_home_page.dart';
import 'package:activity_state_management/bloc/core/pixels_bloc.dart';
import 'package:activity_state_management/home/home_page.dart';
import 'package:activity_state_management/inherited_models/UI/inherited_models_home_page.dart';
import 'package:activity_state_management/inherited_models/core/pixels_provider.dart'
    as models;
import 'package:activity_state_management/inherited_widgets/UI/inherited_widgets_home_page.dart';
import 'package:activity_state_management/inherited_widgets/core/pixels_provider.dart'
    as widgets;
import 'package:activity_state_management/mobx/UI/mobx_home_page.dart';
import 'package:activity_state_management/mobx/core/store.dart';
import 'package:activity_state_management/redux/UI/multi_connector/multi_connector_redux_home_page.dart';
import 'package:activity_state_management/redux/UI/single_connector/single_connector_redux_home_page.dart';
import 'package:activity_state_management/redux/core/app_state.dart';
import 'package:activity_state_management/redux/core/app_state_reducer.dart';
import 'package:activity_state_management/setState/UI/setState_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import 'home/loading_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "homepage": (_) => const HomePage(),
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
              child: const BlocHomePage(
                optimized: false,
              ),
            ),
        "blocOptimized": (context) => BlocProvider(
              create: (context) => PixelsBloc(),
              child: const BlocHomePage(
                optimized: true,
              ),
            ),
        "inheritedWidgets": (context) =>
            const widgets.PixelsProvider(child: InheritedWidgetsHomePage()),
        "inheritedModels": (context) =>
            const models.PixelsProvider(child: InheritedModelsHomePage()),
        "loading": (context) => LoadingPage(
            route: ModalRoute.of(context)!.settings.arguments as String),
      },
      initialRoute: "homepage",
    );
  }
}
