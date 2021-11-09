// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoList on _TodoList, Store {
  Computed<int>? _$lenComputed;

  @override
  int get len =>
      (_$lenComputed ??= Computed<int>(() => super.len, name: '_TodoList.len'))
          .value;
  Computed<int>? _$completedComputed;

  @override
  int get completed => (_$completedComputed ??=
          Computed<int>(() => super.completed, name: '_TodoList.completed'))
      .value;
  Computed<String>? _$statsComputed;

  @override
  String get stats => (_$statsComputed ??=
          Computed<String>(() => super.stats, name: '_TodoList.stats'))
      .value;
  Computed<List<Todo>>? _$filteredTodosComputed;

  @override
  List<Todo> get filteredTodos => (_$filteredTodosComputed ??=
          Computed<List<Todo>>(() => super.filteredTodos,
              name: '_TodoList.filteredTodos'))
      .value;

  final _$todosAtom = Atom(name: '_TodoList.todos');

  @override
  List<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(List<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  final _$filterAtom = Atom(name: '_TodoList.filter');

  @override
  VisibilityFilter get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(VisibilityFilter value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$fetchTodosAsyncAction = AsyncAction('_TodoList.fetchTodos');

  @override
  Future<void> fetchTodos() {
    return _$fetchTodosAsyncAction.run(() => super.fetchTodos());
  }

  final _$saveTodosAsyncAction = AsyncAction('_TodoList.saveTodos');

  @override
  Future<void> saveTodos() {
    return _$saveTodosAsyncAction.run(() => super.saveTodos());
  }

  final _$_TodoListActionController = ActionController(name: '_TodoList');

  @override
  void changeFilter(VisibilityFilter filter) {
    final _$actionInfo =
        _$_TodoListActionController.startAction(name: '_TodoList.changeFilter');
    try {
      return super.changeFilter(filter);
    } finally {
      _$_TodoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodo(Todo todo) {
    final _$actionInfo =
        _$_TodoListActionController.startAction(name: '_TodoList.addTodo');
    try {
      return super.addTodo(todo);
    } finally {
      _$_TodoListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
filter: ${filter},
len: ${len},
completed: ${completed},
stats: ${stats},
filteredTodos: ${filteredTodos}
    ''';
  }
}
