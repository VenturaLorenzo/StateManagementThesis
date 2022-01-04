import 'package:bloc_pattern/blocs/filtered_todo_bloc.dart';
import 'package:bloc_pattern/blocs/todos_bloc.dart';
import 'package:bloc_pattern/events/todos_event.dart';
import 'package:bloc_pattern/models/todo.dart';
import 'package:bloc_pattern/states/filtered_todo_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoItem extends StatelessWidget {
  final int id;

  const TodoItem({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredTodoBloc, FilteredTodoState>(
        buildWhen: (previous, next) {
      if (next is FilteredTodoLoadedState &&
          previous is FilteredTodoLoadedState) {
        if (next.todos.map((todo) => todo.id).toList().contains(id) == true) {
          if (previous.todos.firstWhere((element) => element.id == id) ==
              next.todos.firstWhere((element) => element.id == id)) {
            return false;
          }
        } else {
          return false;
        }
      }
      return true;
    }, builder: (context, state) {
      print("building: Todo Item $id " + key.toString());

      if (state is FilteredTodoLoadedState) {
        Todo t = (state).todos.firstWhere((element) => element.id == id);
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/updateTodo", arguments: t);
          },
          child: Row(
            children: [
              Column(
                children: [
                  Text(t.name,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.black)),
                  Text(t.description,
                      style: const TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
              Checkbox(
                  value: t.completed,
                  onChanged: (completed) {
                    BlocProvider.of<TodoBloc>(context)
                        .add(SetCompletedTodoEvent(id, completed!));
                  }),
            ],
          ),
        );
      } else {
        return Row(
          children: const [
            Text("ERROR"),
          ],
        );
      }
    });
  }
}
