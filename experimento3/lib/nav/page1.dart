import 'package:experimento3/nav/page2.dart';
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Página 1.'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Page2(
                                product: 'Pantalla',
                              )));
                },
                child: const Text('Ir a la página 2')),
            const SizedBox(
              height: 16.0,
            ),
            const Expanded(child: MisWidgets()),
          ],
        ),
      ),
    );
  }
}

class MisWidgets extends StatelessWidget {
  const MisWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text(
            'Mis widgets básicos',
            style: TextStyle(fontSize: 24),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            const SizedBox(width: 8),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined button'),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.headphones),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_reaction_outlined),
            ),
          ],
        ),
        Wrap(
          spacing: 8,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            const SizedBox(width: 8),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined button'),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.headphones),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_reaction_outlined),
            ),
          ],
        ),
        Container(
          color: Colors.green[100],
          width: 200,
          height: 180,
          child: Image.network(
            'https://storage.googleapis.com/cms-storage-bucket/d83012c34a8f88a64e2b.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.green[200],
          width: 200,
          height: 180,
          child: Image.asset(
            'assets/img/ave.jpg',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: InkWell(
            onTap: () => print('Se presionó el botón'),
            child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ]),
            ),
          ),
        ),
        Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Elevated Button'),
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text('Outlined button'),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.headphones),
            ),
          ],
        ),
        const SizedBox(height: 200),
      ],
    );
  }
}
