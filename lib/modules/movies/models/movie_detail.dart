import 'package:desafiocubos/modules/movies/models/genre_item.dart';

/// Classe modelo de **detalhes do titulo**.
class MovieDetail {
  final int id;
  final String title;
  final String origialTitle;
  final double voteAverage;
  final DateTime releaseDate;
  final List<GenreItem> genres;
  final String? posterPath;
  final int? runtime;

  MovieDetail({
    required this.id,
    required this.title,
    required this.origialTitle,
    required this.voteAverage,
    required this.releaseDate,
    required this.genres,
    this.posterPath,
    this.runtime,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) => MovieDetail(
        id: json['id'],
        title: json['title'],
        origialTitle: json['original_title'],
        voteAverage: double.parse(json['vote_average']),
        releaseDate: DateTime.parse(json['release_date']),
        genres: _parseGenreList(json['genres'] as List),
        posterPath: json['poster_path'] ??
            'https://image.tmdb.org/t/p/w500/${json['poster_path']}',
        runtime: json['runtime'],
      );
}

List<GenreItem> _parseGenreList(List list) {
  return list.map((i) => GenreItem.fromJson(i)).toList();
}
