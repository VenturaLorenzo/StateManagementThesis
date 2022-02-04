import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_pattern/blocs/todos_bloc.dart';
import 'package:bloc_pattern/events/stats_event.dart';
import 'package:bloc_pattern/models/stats_model.dart';
import 'package:bloc_pattern/models/todo.dart';
import 'package:bloc_pattern/states/filtered_todo_state.dart';
import 'package:bloc_pattern/states/stats_state.dart';
import 'package:bloc_pattern/states/todos_state.dart';

class StatsBloc extends Bloc<StatsEvent, StatsState> {
  final TodoBloc todoBloc;
  late StreamSubscription todoSubscription;

  StatsBloc({required this.todoBloc}) : super(StatsLoadingState()) {
    void onTodosStateChanged(state) {
      if (state is TodosLoadedState || state is TodosInitialState) {
        add(StatsUpdatedEvent(state.todos));
      }
    }

    onTodosStateChanged(todoBloc.state);

    todoSubscription = todoBloc.stream.listen(onTodosStateChanged);
  }

  @override
  Stream<StatsState> mapEventToState(StatsEvent event) async* {
    if (event is StatsUpdatedEvent) {
      yield StatsLoadingState();
      await Future.delayed(const Duration(seconds: 5));
      final numCompleted =
          event.todos.where((todo) => todo.completed).toList().length;
      yield StatsLoadedState(numCompleted);
    }
  }

  static Stats calculateStats(List<Todo> todos) {
    final completed = todos.where((element) => element.completed).length;
    final active = todos.length;
    return Stats(completed: completed, active: active - completed);
  }

  @override
  Future<void> close() {
    todoSubscription.cancel();
    return super.close();
  }
}
