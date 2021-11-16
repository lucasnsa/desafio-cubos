/// Classe modelo de generos
class GenreItem {
  final int id;
  final String name;

  GenreItem({required this.id, required this.name});

  factory GenreItem.fromJson(Map<String, dynamic> json) =>
      GenreItem(id: json['id'], name: json['name']);
}
