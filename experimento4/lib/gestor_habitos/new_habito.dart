import 'package:flutter/material.dart';

class NewHabito extends StatefulWidget {
  final Function(String, String) submitHabit;

  const NewHabito({super.key, required this.submitHabit});

  @override
  State<NewHabito> createState() => _NewHabitoState();
}

class _NewHabitoState extends State<NewHabito> {
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _descCtrl = TextEditingController();

  void submit() {
    final name = _nameCtrl.text;
    final desc = _descCtrl.text;

    if (name.isNotEmpty && desc.isNotEmpty) {
      widget.submitHabit(name, desc);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nuevo hábito')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameCtrl,
              decoration: const InputDecoration(
                labelText: 'Nombre del hábito',
              ),
            ),
            TextField(
              controller: _descCtrl,
              decoration: const InputDecoration(
                labelText: 'Descripción',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: submit, child: const Text('Agregar')),
          ],
        ),
      ),
    );
  }
}
