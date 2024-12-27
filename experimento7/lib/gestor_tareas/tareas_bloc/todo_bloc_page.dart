import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/todo_bloc.dart';

class TodoBlocPage extends StatelessWidget {
  const TodoBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: const Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestor de tareas"),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state.tasks.isEmpty) {
                  return const Center(
                    child: Text("Lista de tareas vacias :("),
                  );
                } else {
                  return ListView.builder(
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      final task = state.tasks[index];

                      return ListTile(
                        title: Text(task.title),
                        trailing: Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          TodoInputText(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class TodoInputText extends StatelessWidget {
  final TextEditingController _ctrl = TextEditingController();

  TodoInputText({super.key});

  _addTask(BuildContext context) {
    TodoBloc todoBloc = context.read<TodoBloc>();
    if (_ctrl.text.isNotEmpty) {
      todoBloc.add(AddTaskEvent(title: _ctrl.text));
      _ctrl.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _ctrl,
              decoration: const InputDecoration(
                labelText: "Nueva tarea",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => _addTask(context),
            child: const Text("Agregar"),
          ),
        ],
      ),
    );
  }
}
