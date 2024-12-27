import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/animal_bloc.dart';
import 'adopt_card_widget.dart';

class AdoptListWidget extends StatelessWidget {
  const AdoptListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 48,
          bottom: 48,
        ),
        child: BlocBuilder<AnimalBloc, AnimalState>(
          builder: (context, state) {
            if (state.pageState == AnimalPageState.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.pageState == AnimalPageState.failure) {
              return const Center(child: Text("Error al obtener la data"));
            } else if (state.pageState == AnimalPageState.success) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.filteredAnimals.length,
                itemBuilder: (BuildContext context, int index) {
                  final animal = state.filteredAnimals[index];
                  return AdoptCardWidget(
                    animalId: animal.id,
                    name: animal.name,
                    breed: animal.breed,
                    age: animal.age,
                    isFavorite: animal.isFavorite,
                  );
                },
              );
            } else {
              return const Center(child: Text("Sin data"));
            }
          },
        ),
      ),
    );
  }
}
