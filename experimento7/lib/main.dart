import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'gestor_tareas/tareas_bloc/todo_bloc_page.dart';
import 'gestor_tareas/tareas_bloc/bloc/todo_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestor de Tareas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => TodoBloc(),
        child: const TodoBlocPage(),
      ),
    );
  }
}
