import 'package:bloc_tasks_list/blocs/bloc_exports.dart';
import 'package:equatable/equatable.dart';
import '../../models/task.dart';
part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
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

  }

  _deleteTask(DeleteTask event, Emitter<TasksState> emit) {

  }
}

/// bloc class is combination of EVENT and STATE