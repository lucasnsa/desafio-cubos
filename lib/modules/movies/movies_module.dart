import 'package:desafiocubos/modules/movies/views/home/movies_home.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MoviesModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => MoviesHomePage(),
        ),
      ];
}
