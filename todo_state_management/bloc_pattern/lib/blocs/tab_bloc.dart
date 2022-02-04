import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/events/tab_event.dart';
import 'package:bloc_pattern/states/tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabState.todos);

  @override
  Stream<TabState> mapEventToState(TabEvent event) async* {
    if (event is ChangeTabEvent) {
      yield event.tab;
    }
  }
}
