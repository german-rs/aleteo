import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/animal_bloc.dart';

class AdoptCardWidget extends StatelessWidget {
  final String animalId;
  final String name;
  final String breed;
  final int age;
  final bool isFavorite;

  const AdoptCardWidget({
    super.key,
    required this.animalId,
    required this.name,
    required this.breed,
    required this.age,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.only(
        top: 18,
        bottom: 18,
      ),
      margin: const EdgeInsets.only(
        right: 8,
        left: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundColor: const Color(0xFF91C9B9),
          ),
          // Name
          Text(
            name,
            style: const TextStyle(
              color: Color(0xFF3C2F20),
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
          // Breed
          Text(
            breed,
            style: const TextStyle(
              color: Color(0xFF3C2F20),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          // Age
          Text(
            "$age Years",
            style: const TextStyle(
              color: Color(0xFF3C2F20),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          // Fav
          IconButton(
            onPressed: () {
              context.read<AnimalBloc>().add(ToggleFavorite(animalId));
            },
            icon: Icon(
              isFavorite ? Icons.favorite_sharp : Icons.favorite_border,
              size: 40,
              color: isFavorite ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
