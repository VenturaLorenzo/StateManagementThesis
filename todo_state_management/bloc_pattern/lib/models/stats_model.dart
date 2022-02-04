class Stats {
  final int completed;
  final int active;

  Stats({required this.completed, required this.active});

  @override
  String toString() => '{completed : $completed , active : $active}';
}
