/// Classe de abstração base do Repositorio
abstract class Repository {
  Future<List> listMoviesbyGenre(int genre, {int page = 1});
  Future getMovieDetail(int movieId);
  Future<List> searchMovies(String query, {int page = 1});
}
