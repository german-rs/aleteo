import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/animal_model.dart';
import '../data/data.dart';

part 'animal_event.dart';
part 'animal_state.dart';

class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  AnimalBloc() : super(AnimalState.initial()) {
    on<LoadAnimals>(_onLoadAnimals);
    on<ToggleFavorite>(_onToggleFavorite);
    on<ChangeFilter>(_onChangeFilter);
  }

  void _onLoadAnimals(LoadAnimals event, Emitter<AnimalState> emit) async {
    emit(state.copyWith(pageState: AnimalPageState.loading));
    try {
      await Future.delayed(const Duration(seconds: 1));
      final animal = animalData.map((json) {
        return AnimalModel(
          id: json["id"],
          name: json["name"],
          breed: json["breed"],
          age: json["age"],
          imageUrl: json["imageUrl"],
          type: json["type"],
        );
      }).toList();

      final filteredAnimals = animal
          .where(
            (an) => an.type == state.filter,
          )
          .toList();

      emit(state.copyWith(
        animals: animal,
        filteredAnimals: filteredAnimals,
        pageState: AnimalPageState.success,
      ));
    } catch (e) {
      emit(state.copyWith(pageState: AnimalPageState.failure));
    }
  }

  void _onToggleFavorite(ToggleFavorite event, Emitter<AnimalState> emit) {
    final updatedAnimals = state.animals.map((animal) {
      if (animal.id == event.animalId) {
        return animal.copyWith(isFavorite: !animal.isFavorite);
      }
      return animal;
    }).toList();

    final favoriteAnimals =
        updatedAnimals.where((animal) => animal.isFavorite).toList();

    final filteredAnimals = updatedAnimals
        .where(
          (an) => an.type == state.filter,
        )
        .toList();

    emit(state.copyWith(
      animals: updatedAnimals,
      filteredAnimals: filteredAnimals,
      favorites: favoriteAnimals,
    ));
  }

  void _onChangeFilter(ChangeFilter event, Emitter<AnimalState> emit) {
    final filteredAnimals = state.animals
        .where(
          (an) => an.type == event.filter,
        )
        .toList();

    emit(state.copyWith(
      filteredAnimals: filteredAnimals,
      filter: event.filter,
    ));
  }
}
