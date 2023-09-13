import 'package:bloc_tasks_list/blocs/bloc_exports.dart';
import 'package:equatable/equatable.dart';
import '../../models/task.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_addTask);
    on<UpdateTask>(_updateTask);
    on<DeleteTask>(_deleteTask);
  }

  _addTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(allTasks: List.from(state.allTasks)..add(event.task)),
    );
  }

  _updateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;
    final int index = state.allTasks.indexOf(task);
    List<Task> allTasks = List.from(state.allTasks)..remove(task);

    /// if old value for isDone flag is false then we update the isDone to true
    /// because we've updated task and new update task is yet to complete
    task.isDone == false ? allTasks.insert(index, task.copyWith(isDone: true)) : allTasks.insert(index, task.copyWith(isDone: false));

    emit(
      TasksState(allTasks: allTasks),
    );
  }

  _deleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(allTasks: List.from(state.allTasks)..remove(event.task)),
    );
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) => TasksState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(TasksState state) => state.toMap();
}

/// bloc class is combination of EVENT and STATE
