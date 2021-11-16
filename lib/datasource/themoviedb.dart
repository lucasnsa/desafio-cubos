import 'package:http/http.dart';
import 'package:http_get_cache/http_get_cache.dart';

/// Classe DataSource para Infraestrutura de [https://www.themoviedb.org/]
/// Consome requisições da biblioteca **GetCache**.
/// **GetCache** decide qual a fonte de dados, cache ou servidor.
class TheMovieDB {
  final GetCache _cachedHttp;

  TheMovieDB._(this._cachedHttp);

  /// Inicializa o datasource.
  /// Garanta que a biblioteca **GetCache** seja inicializada antes.
  /// ```dart
  ///   void main() async {
  ///       WidgetsFlutterBinding.ensureInitialized();
  ///        await GetCache.initialize();
  ///        ...
  /// ```
  factory TheMovieDB.initilize(GetCache cache) {
    return TheMovieDB._(cache);
  }

  // Token bearer para autenticação
  String get _tokenV3 =>
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzJkZTJlOTRiNTZhMzE2OGJhMjk0NGQwZjU1ZjU0OCIsInN1YiI6IjYxOGZhMDc3NjNlNmZiMDA4ZGNjZGVlNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HWxvzKeTs6MmA4QtLssxCWLgM0ZdyEbFM_TYKyg2_T8';

  /// Headers com autenticação
  Map<String, String> get authHeader => {
        'Content-Type': 'application/json;charset=utf-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $_tokenV3',
      };

  // Metodo interno bypass para GetCache
  Future<Response> _get(String url) {
    return _cachedHttp.get(Uri.parse(url), headers: authHeader);
  }

  /// Busca no **cache ou no servidor** titulos por genero
  Future<Response> getMoviesByGenre(int genre, {int page = 1}) {
    final getMovies =
        'https://api.themoviedb.org/3/discover/movie?language=pt-BR&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page&with_genres=$genre&with_watch_monetization_types=flatrate';
    return _get(getMovies);
  }

  /// Busca no **cache ou no servidor** por detalhes de um titulo especifico
  Future<Response> getMovieDetail(int movieId) {
    final getMovieDetail =
        'https://api.themoviedb.org/3/movie/$movieId?language=pt-BR&append_to_response=credits';
    return _get(getMovieDetail);
  }

  /// Procura no **cache ou no servidor** titulos respeitando uma [query]
  Future<Response> searchMovies(String query, {int page = 1}) {
    final searchMovies =
        'https://api.themoviedb.org/3/search/movie?language=pt-BR&page=$page&query=$query&include_adult=false';
    return _get(searchMovies);
  }
}
