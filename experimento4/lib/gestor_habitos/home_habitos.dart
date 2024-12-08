import 'package:experimento4/gestor_habitos/new_habito.dart';
import 'package:flutter/material.dart';

class HomeHabitosPage extends StatefulWidget {
  const HomeHabitosPage({super.key});

  @override
  State<HomeHabitosPage> createState() => _HomeHabitosPageState();
}

class _HomeHabitosPageState extends State<HomeHabitosPage> {
  final List<Habito> habits = [];

  void _addHabito(String name, String desc) {
    setState(() {
      habits.add(
        Habito(
          name: name,
          description: desc,
        ),
      );
    });
  }

  void changeStatus(int index) {
    setState(() {
      habits[index].isComplete = !habits[index].isComplete;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestor de hábitos'),
      ),
      body: ListView.builder(
        itemCount: habits.length,
        itemBuilder: (context, index) {
          String _name = habits[index].name;
          String _desc = habits[index].description;
          bool _isComplete = habits[index].isComplete;

          return ListTile(
            onTap: () {
              changeStatus(index);
            },
            title: Text(_name),
            subtitle: Text(_desc),
            trailing: _isComplete
                ? const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  )
                : const Icon(Icons.circle_outlined),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewHabito(
                submitHabit: _addHabito,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Habito {
  String name;
  String description;
  bool isComplete;

  Habito({
    required this.name,
    required this.description,
    this.isComplete = false,
  });

  @override
  String toString() {
    return 'name: $name, description: $description, isComplete: $isComplete';
  }
}
