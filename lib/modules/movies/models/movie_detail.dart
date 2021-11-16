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
  final int budget;
  final List<String> companies;
  final String overview;
  final List<String> cast;
  final List<String> crew;

  MovieDetail({
    required this.id,
    required this.title,
    required this.origialTitle,
    required this.voteAverage,
    required this.releaseDate,
    required this.genres,
    this.posterPath,
    this.runtime,
    required this.budget,
    required this.companies,
    required this.overview,
    required this.cast,
    required this.crew,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) => MovieDetail(
        id: json['id'],
        title: json['title'],
        origialTitle: json['original_title'],
        voteAverage: json['vote_average'],
        releaseDate: DateTime.parse(json['release_date']),
        genres: _parseGenreList(json['genres'] as List),
        posterPath: json['poster_path'] ??
            'https://image.tmdb.org/t/p/w500/${json['poster_path']}',
        runtime: json['runtime'],
        budget: json['budget'],
        companies: _parseCompaniesList(json['production_companies']),
        overview: json['overview'],
        cast: _parseCastList(json['credits']['cast']),
        crew: _parseCrewProducerList(json['credits']['crew']),
      );
}

List<GenreItem> _parseGenreList(List list) {
  return list.map((i) => GenreItem.fromJson(i)).toList();
}

List<String> _parseCompaniesList(List list) {
  return list.map((i) => i['name'] as String).toList();
}

List<String> _parseCastList(List list) {
  return list.map((i) => i['name'] as String).toList().sublist(0, 6);
}

List<String> _parseCrewProducerList(List list) {
  return list
      .where((e) => (e['job'] as String) == 'Director')
      .map((i) => i['name'] as String)
      .toList();
}
