class CharacterList {
  final List<Character> characters;

  CharacterList({
    required this.characters,
  });

  factory CharacterList.fromJson(List<dynamic> parsedJson) {
    List<Character> characters = <Character>[];
    characters = parsedJson.map((i) => Character.fromJson(i)).toList();

    return CharacterList(
      characters: characters,
    );
  }
}

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;

  const Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      image: json['image'],
    );
  }
}
