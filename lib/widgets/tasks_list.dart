import 'package:bloc_tasks_list/blocs/bloc_exports.dart';
import 'package:flutter/material.dart';
import '../models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasksList,
  });

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasksList.length,
        itemBuilder: (context, index) {
          var task = tasksList[index];
          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: (val) {
                context.read<TasksBloc>().add(UpdateTask(task: task));
              },
            ),
            onLongPress: () => context.read<TasksBloc>().add(DeleteTask(task: task)),
          );
        },
      ),
    );
  }
}
