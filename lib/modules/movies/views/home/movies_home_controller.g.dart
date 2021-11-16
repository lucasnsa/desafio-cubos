// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoviesHomeController on _MoviesHomeControllerBase, Store {
  final _$actualGenreAtom = Atom(name: '_MoviesHomeControllerBase.actualGenre');

  @override
  int get actualGenre {
    _$actualGenreAtom.reportRead();
    return super.actualGenre;
  }

  @override
  set actualGenre(int value) {
    _$actualGenreAtom.reportWrite(value, super.actualGenre, () {
      super.actualGenre = value;
    });
  }

  final _$searchTermAtom = Atom(name: '_MoviesHomeControllerBase.searchTerm');

  @override
  String get searchTerm {
    _$searchTermAtom.reportRead();
    return super.searchTerm;
  }

  @override
  set searchTerm(String value) {
    _$searchTermAtom.reportWrite(value, super.searchTerm, () {
      super.searchTerm = value;
    });
  }

  final _$tabIndexAtom = Atom(name: '_MoviesHomeControllerBase.tabIndex');

  @override
  int get tabIndex {
    _$tabIndexAtom.reportRead();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.reportWrite(value, super.tabIndex, () {
      super.tabIndex = value;
    });
  }

  final _$_fetchPageAsyncAction =
      AsyncAction('_MoviesHomeControllerBase._fetchPage');

  @override
  Future<void> _fetchPage(int fetchPage, int genre, String searchTerm) {
    return _$_fetchPageAsyncAction
        .run(() => super._fetchPage(fetchPage, genre, searchTerm));
  }

  final _$changeSearchTermAsyncAction =
      AsyncAction('_MoviesHomeControllerBase.changeSearchTerm');

  @override
  Future<void> changeSearchTerm(String term) {
    return _$changeSearchTermAsyncAction
        .run(() => super.changeSearchTerm(term));
  }

  final _$_MoviesHomeControllerBaseActionController =
      ActionController(name: '_MoviesHomeControllerBase');

  @override
  void initPagingController() {
    final _$actionInfo = _$_MoviesHomeControllerBaseActionController
        .startAction(name: '_MoviesHomeControllerBase.initPagingController');
    try {
      return super.initPagingController();
    } finally {
      _$_MoviesHomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeGenre(int genre) {
    final _$actionInfo = _$_MoviesHomeControllerBaseActionController
        .startAction(name: '_MoviesHomeControllerBase.changeGenre');
    try {
      return super.changeGenre(genre);
    } finally {
      _$_MoviesHomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
actualGenre: ${actualGenre},
searchTerm: ${searchTerm},
tabIndex: ${tabIndex}
    ''';
  }
}
