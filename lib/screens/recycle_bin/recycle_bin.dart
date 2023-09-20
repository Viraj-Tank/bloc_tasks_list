import 'package:flutter/material.dart';

import '../../blocs/bloc_exports.dart';
import '../../blocs/task/tasks_bloc.dart';
import '../../widgets/tasks_list.dart';
import '../my_drawer.dart';

class RecycleBin extends StatelessWidget {
  static const id = 'recycle_bin';

  const RecycleBin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text('${state.removedTasks.length} Tasks'),
                ),
              ),
              TasksList(tasksList: state.removedTasks)
            ],
          ),
        );
      },
    );
  }
}
