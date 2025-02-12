class AnimalModel {
  final String id;
  final String name;
  final String breed;
  final int age;
  final String imageUrl;
  final String type;
  final bool isFavorite;

  const AnimalModel({
    required this.id,
    required this.name,
    required this.breed,
    required this.age,
    required this.imageUrl,
    required this.type,
    this.isFavorite = false,
  });

  AnimalModel copyWith({bool? isFavorite}) {
    return AnimalModel(
      id: id,
      name: name,
      breed: breed,
      age: age,
      imageUrl: imageUrl,
      type: type,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
