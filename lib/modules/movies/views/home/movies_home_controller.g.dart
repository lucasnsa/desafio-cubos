// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoviesHomeController on _MoviesHomeControllerBase, Store {
  final _$_fetchPageAsyncAction =
      AsyncAction('_MoviesHomeControllerBase._fetchPage');

  @override
  Future<void> _fetchPage(int fetchPage, int genre) {
    return _$_fetchPageAsyncAction
        .run(() => super._fetchPage(fetchPage, genre));
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

    ''';
  }
}
