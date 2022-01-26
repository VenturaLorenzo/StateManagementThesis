// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoStore on _TodoStore, Store {
  Computed<List<Todo>>? _$filteredTodosComputed;

  @override
  List<Todo> get filteredTodos => (_$filteredTodosComputed ??=
          Computed<List<Todo>>(() => super.filteredTodos,
              name: '_TodoStore.filteredTodos'))
      .value;
  Computed<int>? _$lenComputed;

  @override
  int get len =>
      (_$lenComputed ??= Computed<int>(() => super.len, name: '_TodoStore.len'))
          .value;
  Computed<int>? _$completedComputed;

  @override
  int get completed => (_$completedComputed ??=
          Computed<int>(() => super.completed, name: '_TodoStore.completed'))
      .value;
  Computed<int>? _$pendingComputed;

  @override
  int get pending => (_$pendingComputed ??=
          Computed<int>(() => super.pending, name: '_TodoStore.pending'))
      .value;
  Computed<Future<String>>? _$statsComputed;

  @override
  Future<String> get stats => (_$statsComputed ??=
          Computed<Future<String>>(() => super.stats, name: '_TodoStore.stats'))
      .value;
  Computed<List<Todo>>? _$completedTodosComputed;

  @override
  List<Todo> get completedTodos => (_$completedTodosComputed ??=
          Computed<List<Todo>>(() => super.completedTodos,
              name: '_TodoStore.completedTodos'))
      .value;
  Computed<List<Todo>>? _$pendingTodosComputed;

  @override
  List<Todo> get pendingTodos =>
      (_$pendingTodosComputed ??= Computed<List<Todo>>(() => super.pendingTodos,
              name: '_TodoStore.pendingTodos'))
          .value;

  final _$todosAtom = Atom(name: '_TodoStore.todos');

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

  final _$filterAtom = Atom(name: '_TodoStore.filter');

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

  final _$fetchTodosAsyncAction = AsyncAction('_TodoStore.fetchTodos');

  @override
  Future<void> fetchTodos() {
    return _$fetchTodosAsyncAction.run(() => super.fetchTodos());
  }

  final _$saveTodosAsyncAction = AsyncAction('_TodoStore.saveTodos');

  @override
  Future<void> saveTodos() {
    return _$saveTodosAsyncAction.run(() => super.saveTodos());
  }

  final _$_TodoStoreActionController = ActionController(name: '_TodoStore');

  @override
  void changeFilter(VisibilityFilter filter) {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.changeFilter');
    try {
      return super.changeFilter(filter);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTodo(int id, String name, String desc) {
    final _$actionInfo =
        _$_TodoStoreActionController.startAction(name: '_TodoStore.updateTodo');
    try {
      return super.updateTodo(id, name, desc);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompleted(int id, bool completed) {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.setCompleted');
    try {
      return super.setCompleted(id, completed);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodo(String name, String desc) {
    final _$actionInfo =
        _$_TodoStoreActionController.startAction(name: '_TodoStore.addTodo');
    try {
      return super.addTodo(name, desc);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
filter: ${filter},
filteredTodos: ${filteredTodos},
len: ${len},
completed: ${completed},
pending: ${pending},
stats: ${stats},
completedTodos: ${completedTodos},
pendingTodos: ${pendingTodos}
    ''';
  }
}
