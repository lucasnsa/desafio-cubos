import 'dart:convert';

import 'package:desafiocubos/datasource/themoviedb.dart';
import 'package:desafiocubos/interfaces/repository.dart';
import 'package:desafiocubos/modules/movies/models/movie_detail.dart';
import 'package:desafiocubos/modules/movies/models/movie_item.dart';


/// Classe Repositorio que consome o DataSource [TheMovieDB]
class TmdbRepository implements Repository {
  final TheMovieDB _dataSource;

  TmdbRepository(this._dataSource);

  /// Busca **detalhes** do titulo selecionado
  @override
  Future<MovieDetail> getMovieDetail(int movieId) async {
    final response = await _dataSource.getMoviesByGenre(movieId);
    final Map<String, dynamic> json = jsonDecode(response.body);

    return MovieDetail.fromJson(json);
  }

  /// Lista todos os titulos com determinado **genero**
  /// Valor padrão de [pagina] é **1**
  @override
  Future<List<MovieItem>> listMoviesbyGenre(int genre, {int page = 1}) async {
    final response = await _dataSource.getMoviesByGenre(genre, page: page);

    final Map<String, dynamic> json = jsonDecode(response.body);
    final listMovies = json['results'] as List;

    return listMovies.map((e) => MovieItem.fromJson(e)).toList();
  }

  /// Busca no **DataSource** conforme a [query]
  /// Valor padrão de [pagina] é **1**
  @override
  Future<List> searchMovies(String query, {int page = 1}) async {
    final response = await _dataSource.searchMovies(query, page: page);

    final Map<String, dynamic> json = jsonDecode(response.body);
    final listMovies = json['results'] as List;

    return listMovies.map((e) => MovieItem.fromJson(e)).toList();
  }
}
