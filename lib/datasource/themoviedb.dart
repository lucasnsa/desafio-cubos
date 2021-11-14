import 'package:http/http.dart';
import 'package:http_get_cache/http_get_cache.dart';

class TheMovieDB {
  final GetCache _cachedHttp;

  TheMovieDB._(this._cachedHttp);

  factory TheMovieDB.initilize(GetCache cache) {
    return TheMovieDB._(cache);
  }

  String get _tokenV3 =>
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMzJkZTJlOTRiNTZhMzE2OGJhMjk0NGQwZjU1ZjU0OCIsInN1YiI6IjYxOGZhMDc3NjNlNmZiMDA4ZGNjZGVlNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.HWxvzKeTs6MmA4QtLssxCWLgM0ZdyEbFM_TYKyg2_T8';

  Map<String, String> get authHeader => {
        'Content-Type': 'application/json;charset=utf-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $_tokenV3',
      };

  Future<Response> get(String url) {
    return _cachedHttp.get(Uri.parse(url), headers: authHeader);
  }
}
