// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDetailController on _MovieDetailControllerBase, Store {
  final _$fetchReposFutureAtom =
      Atom(name: '_MovieDetailControllerBase.fetchReposFuture');

  @override
  ObservableFuture<MovieDetail?> get fetchReposFuture {
    _$fetchReposFutureAtom.reportRead();
    return super.fetchReposFuture;
  }

  @override
  set fetchReposFuture(ObservableFuture<MovieDetail?> value) {
    _$fetchReposFutureAtom.reportWrite(value, super.fetchReposFuture, () {
      super.fetchReposFuture = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_MovieDetailControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$fetchReposAsyncAction =
      AsyncAction('_MovieDetailControllerBase.fetchRepos');

  @override
  Future<MovieDetail?> fetchRepos(int movieId) {
    return _$fetchReposAsyncAction.run(() => super.fetchRepos(movieId));
  }

  @override
  String toString() {
    return '''
fetchReposFuture: ${fetchReposFuture},
isLoading: ${isLoading}
    ''';
  }
}
