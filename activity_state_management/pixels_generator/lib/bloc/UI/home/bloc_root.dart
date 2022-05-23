import 'bloc_navigator.dart';
import 'package:activity_state_management/bloc/core/user/user_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/pixels/pixels_bloc.dart';

class BlocRoot extends StatelessWidget {
  final String subRoute;
  const BlocRoot({Key? key, required this.subRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => PixelsBloc()),
      BlocProvider(create: (context) => UserBloc())
    ], child: BlocNavigator(setupPageRoute: subRoute,));
  }
}
