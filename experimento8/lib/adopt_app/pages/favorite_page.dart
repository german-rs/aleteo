import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/animal_bloc.dart';
import '../widgets/adopt_bottom_navigation_bar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AnimalBloc, AnimalState>(
        builder: (context, state) {
          if (state.favorites.isEmpty) {
            return const Center(
              child: Text("No hay favoritos aún."),
            );
          }

          return ListView.builder(
            itemCount: state.favorites.length,
            itemBuilder: (context, index) {
              final animal = state.favorites[index];
              return ListTile(
                title: Text(animal.name),
                subtitle: Text(animal.breed),
                trailing: const Icon(Icons.favorite, color: Colors.red),
              );
            },
          );
        },
      ),
      bottomNavigationBar: AdoptBottomNavigationBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
