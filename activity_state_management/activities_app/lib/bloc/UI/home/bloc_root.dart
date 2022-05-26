import 'package:activity_state_management/bloc/core/heart_rate/core/heart_rate_bloc.dart';
import 'package:activity_state_management/bloc/core/heart_rate/heart_rate_store/heart_rate_store_bloc.dart';

import 'bloc_navigator.dart';
import 'package:activity_state_management/bloc/core/user/user_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/pixels/pixels_bloc.dart';

class BlocRoot extends StatelessWidget {
  final String subRoute;
  BlocRoot({Key? key, required this.subRoute}) : super(key: key);
  final HeartRateBloc bloc= HeartRateBloc();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<PixelsBloc>(create: (context) => PixelsBloc()),
      BlocProvider<UserBloc>(create: (context) => UserBloc()),
      BlocProvider<HeartRateBloc>(create: (context) => bloc),
      BlocProvider<HeartRateStoreBloc>(create: (context) => HeartRateStoreBloc(bloc)),
    ], child: BlocNavigator(setupPageRoute: subRoute,));
  }
}
