import 'package:desafiocubos/modules/movies/models/genre_item.dart';

final genreList = [
  GenreItem(id: 28, name: 'Ação'),
  GenreItem(id: 12, name: 'Aventura'),
  GenreItem(id: 16, name: 'Animação'),
  GenreItem(id: 35, name: 'Comédia'),
  GenreItem(id: 80, name: 'Crime'),
  GenreItem(id: 99, name: 'Documentário'),
  GenreItem(id: 18, name: 'Drama'),
  GenreItem(id: 14, name: 'Fantasia'),
  GenreItem(id: 10751, name: 'Família'),
  GenreItem(id: 36, name: 'História'),
  GenreItem(id: 27, name: 'Terror'),
  GenreItem(id: 10402, name: 'Música'),
  GenreItem(id: 9648, name: 'Mistério'),
  GenreItem(id: 10749, name: 'Romance'),
  GenreItem(id: 878, name: 'Ficção científica'),
  GenreItem(id: 10770, name: 'Cinema TV'),
  GenreItem(id: 53, name: 'Thriller'),
  GenreItem(id: 10752, name: 'Guerra'),
  GenreItem(id: 37, name: 'Faroeste'),
];

GenreItem? getGenreById(int id) =>
    genreList.firstWhere((element) => element.id == id);

String getGenreNameById(int id) => genreList
    .firstWhere(
      (element) => element.id == id,
      orElse: () => GenreItem(id: 0, name: ''),
    )
    .name;

int getGenreIdByName(String name) => genreList
    .firstWhere(
      (element) => element.name == name,
      orElse: () => GenreItem(id: 0, name: ''),
    )
    .id;

int tabToGenreId(int tab) {
  switch (tab) {
    case 0:
      return 28;
    case 1:
      return 12;
    case 2:
      return 14;
    case 3:
      return 35;
    default:
      return 28;
  }
}
