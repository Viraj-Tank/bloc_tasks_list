part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  final List<Task> removedTasks;

  const TasksState({
    this.allTasks = const [],
    this.removedTasks = const [],
  });

  @override
  List<Object?> get props => [allTasks, removedTasks];

  Map<String, dynamic> toMap() {
    return {
      'allTasks': allTasks.map((e) => e.toJson()).toList(),
      'removedTasks': removedTasks.map((e) => e.toJson()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<Task>.from(map['allTasks'].map((e) => Task.fromJson(e))),
      removedTasks: List<Task>.from(map['removedTasks'].map((e) => Task.fromJson(e))),
    );
  }
}

/// this class acts as data holder - these data will reflect in UI (for provider we can say this class as ChangeNotifier)
