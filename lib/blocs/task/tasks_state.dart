part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;

  const TasksState({
    this.allTasks = const [],
  });

  @override
  List<Object?> get props => [allTasks];

  Map<String, dynamic> toMap() {
    return {
      'allTasks': allTasks,
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      allTasks: map['allTasks'] as List<Task>,
    );
  }
}

/// this class acts as data holder - these data will reflect in UI (for provider we can say this class as ChangeNotifier)