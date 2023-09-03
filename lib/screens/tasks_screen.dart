import 'package:bloc_tasks_list/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/add_task_screen.dart';
import '../widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: AddTaskScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () => _addTask(context),
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(label: Text('Tasks:')),
              ),
              TasksList(tasksList: tasksList)
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
