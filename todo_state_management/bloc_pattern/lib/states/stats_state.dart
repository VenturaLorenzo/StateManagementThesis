import 'package:bloc_pattern/models/stats_model.dart';
import 'package:equatable/equatable.dart';

abstract class StatsState extends Equatable{
  const StatsState();

  @override
  List<Object> get props => [];
}
class StatsLoadingState extends StatsState{

}

class StatsLoadedState extends StatsState{
  final int active;
  final int completed;

  const StatsLoadedState(this.active,this.completed);


  @override
  List<Object> get props => [active, completed];


  @override
  String toString(){
    return 'StatsLoadedState : {stats : $active, completed: $completed}';
  }


}