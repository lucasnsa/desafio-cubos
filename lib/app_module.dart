import 'package:desafiocubos/datasource/themoviedb.dart';
import 'package:desafiocubos/modules/movies/movies_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http_get_cache/http_get_cache.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton(
          (i) => TheMovieDB.initilize(GetCache.instance),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: MoviesModule(),
        ),
      ];
}
