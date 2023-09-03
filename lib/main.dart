import 'package:bloc_tasks_list/screens/tasks_screen.dart';
import 'package:flutter/material.dart';

import 'blocs/bloc_exports.dart';
import 'models/task.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        title: 'Task App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
