import 'package:desafiocubos/modules/movies/repository/tmdb_repository.dart';
import 'package:desafiocubos/modules/movies/views/detail/movie_detail_page.dart';
import 'package:desafiocubos/modules/movies/views/detail/movie_detail_controller.dart';
import 'package:desafiocubos/modules/movies/views/home/movies_home_page.dart';
import 'package:desafiocubos/modules/movies/views/home/movies_home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MoviesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => TmdbRepository(i.get()),
        ),
        Bind.singleton(
          (i) => MoviesHomeController(
            i.get(),
          ),
        ),
        Bind.singleton(
          (i) => MovieDetailController(
            i.get(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const MoviesHomePage(),
        ),
        ChildRoute(
          '/detail',
          child: (context, args) => MovieDetailPage(
            movieItem: args.data,
          ),
        ),
      ];
}
