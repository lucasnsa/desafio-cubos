/// Classe modelo de **listagem de titulos**
class MovieItem {
  final int id;
  final String title;
  final List<int> genres;
  final String? posterPath;

  MovieItem({
    required this.id,
    required this.title,
    required this.genres,
    this.posterPath,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) => MovieItem(
        id: json['id'],
        title: json['title'],
        genres: List.castFrom<dynamic, int>(json['genre_ids']).toList(),
        posterPath: json['poster_path'] ??
            'https://image.tmdb.org/t/p/w500/${json['poster_path']}',
      );
}
