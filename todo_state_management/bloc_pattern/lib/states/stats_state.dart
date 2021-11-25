import 'package:bloc_pattern/models/stats_model.dart';
import 'package:equatable/equatable.dart';

abstract class StatsState extends Equatable{
  const StatsState();

  @override
  List<Object> get props => [];
}
class StatsLoadingState extends StatsState{
  @override
  String toString(){
    return 'StatsState - StatsLoadingState';
  }
}

class StatsLoadedState extends StatsState{
  final int completed;

  const StatsLoadedState(this.completed);


  @override
  List<Object> get props => [completed];


  @override
  String toString(){
    return 'StatsState - StatsLoadedState : {completed: $completed}';
  }


}