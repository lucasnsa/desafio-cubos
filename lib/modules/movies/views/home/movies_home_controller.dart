import 'package:desafiocubos/modules/movies/models/movie_item.dart';
import 'package:desafiocubos/modules/movies/repository/tmdb_repository.dart';
import 'package:desafiocubos/utils/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';

part 'movies_home_controller.g.dart';

class MoviesHomeController = _MoviesHomeControllerBase
    with _$MoviesHomeController;

abstract class _MoviesHomeControllerBase with Store {
  final TmdbRepository _repository;

  final searchDebouncer = Debouncer(const Duration(milliseconds: 500));

  final PagingController<int, MovieItem> _pagingController =
      PagingController(firstPageKey: 1);

  PagingController<int, MovieItem> get pagingController => _pagingController;

  static const _pageSize = 20;

  _MoviesHomeControllerBase(this._repository) {
    initPagingController();
  }

  @observable
  int actualGenre = 28;

  @observable
  String searchTerm = '';

  @observable
  int tabIndex = 0;

  @action
  void initPagingController() {
    _pagingController.addPageRequestListener((page) {
      _fetchPage(page, actualGenre, searchTerm);
    });
  }

  @action
  Future<void> _fetchPage(int fetchPage, int genre, String searchTerm) async {
    try {
      final newItems = searchTerm.isEmpty
          ? await _repository.listMoviesbyGenre(genre, page: fetchPage)
          : await _repository.searchMovies(searchTerm, page: fetchPage);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final key = _pagingController.nextPageKey! + newItems.length;
        _pagingController.appendPage(newItems, key);
      }
    } catch (error) {
      debugPrint('error ' + error.toString());
      _pagingController.error = error;
    }
  }

  @action
  void changeGenre(int genre) {
    if (actualGenre != genre) {
      actualGenre = genre;
      _pagingController.refresh();
    }
  }

  @action
  Future<void> changeSearchTerm(String term) async {
    if (searchTerm != term) {
      searchTerm = term;
      _pagingController.refresh();
    }
  }

  void performSearch(String term) {
    searchDebouncer(() => changeSearchTerm(term));
  }
}
