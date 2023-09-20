import 'package:bloc_tasks_list/screens/recycle_bin/recycle_bin.dart';
import 'package:bloc_tasks_list/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

import '../blocs/bloc_exports.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.grey,
              padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
              child: Text(
                'Task Drawer',
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineSmall,
              ),
            ),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (_, state) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, TasksScreen.id),
                  child: ListTile(
                    leading: const Icon(Icons.folder_special),
                    title: const Text('My Tasks'),
                    trailing: Text('${state.allTasks.length}'),
                  ),
                );
              },
            ),
            const Divider(),
            BlocBuilder<TasksBloc, TasksState>(
              builder: (_, state) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, RecycleBin.id),
                  child: ListTile(
                    leading: const Icon(Icons.delete),
                    title: const Text('Bin'),
                    trailing: Text('${state.removedTasks.length}'),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
