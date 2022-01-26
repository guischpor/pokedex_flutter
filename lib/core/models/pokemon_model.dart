class PokemonModel {
  final int id;
  final String num;
  final String name;
  final String image;
  final List<String> type;

  factory PokemonModel.fromMap(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      num: json['num'] ?? '',
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  PokemonModel({
    required this.id,
    required this.num,
    required this.name,
    required this.image,
    required this.type,
  });
}
