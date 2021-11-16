import 'package:desafiocubos/modules/movies/models/movie_detail.dart';
import 'package:desafiocubos/modules/movies/repository/tmdb_repository.dart';
import 'package:mobx/mobx.dart';

part 'movie_detail_controller.g.dart';

class MovieDetailController = _MovieDetailControllerBase
    with _$MovieDetailController;

abstract class _MovieDetailControllerBase with Store {
  final TmdbRepository _repository;

  _MovieDetailControllerBase(this._repository);

  static ObservableFuture<MovieDetail?> emptyResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<MovieDetail?> fetchReposFuture = emptyResponse;

  @observable
  bool isLoading = false;

  MovieDetail? movieDetail;

  @action
  Future<MovieDetail?> fetchRepos(int movieId) async {
    movieDetail = null;
    final future = _repository
        .getMovieDetail(movieId);
    fetchReposFuture = ObservableFuture(future);

    return movieDetail = await future;
  }

  Future<MovieDetail> getDetail(int movieId) async {
    isLoading = true;
    return await _repository
        .getMovieDetail(movieId)
        .whenComplete(() => isLoading = false);
  }
}
