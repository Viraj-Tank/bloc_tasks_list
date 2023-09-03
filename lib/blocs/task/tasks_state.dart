part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;

  const TasksState({
    this.allTasks = const [],
  });

  @override
  List<Object?> get props => [allTasks];
}

/// this class acts as data holder - these data will reflect in UI (for provider we can say this class as ChangeNotifier)