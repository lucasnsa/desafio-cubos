import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafiocubos/modules/movies/models/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieItem movieItem;
  const MovieDetailPage({Key? key, required this.movieItem}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: const Color(0xFFF5F5F5),
            foregroundColor: Colors.black,
            primary: true,
            pinned: false,
            automaticallyImplyLeading: false,
            title: ActionChip(
              backgroundColor: Colors.white,
              avatar: const Icon(
                Icons.arrow_back_ios,
                size: 10,
                color: Colors.black,
              ),
              label: const Text('Voltar'),
              shape: const StadiumBorder(),
              elevation: 0.5,
              onPressed: () {
                Modular.to.pop();
              },
            ),
            elevation: 0,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
              child: Stack(
                clipBehavior: Clip.hardEdge,
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: 0,
                    child: IntrinsicWidth(
                      child: Container(
                        height: 203,
                        width: MediaQuery.of(context).size.width,
                        color: const Color(0xFFF5F5F5),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 36,
                    left: MediaQuery.of(context).size.width / 4,
                    child: Hero(
                      tag:
                          widget.movieItem.posterPath ?? widget.movieItem.title,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        child: SizedBox(
                          height: 318,
                          width: 216,
                          child: Image(
                            image: CachedNetworkImageProvider(
                              widget.movieItem.posterPath!,
                            ),
                            fit: BoxFit.cover,
                          ),
                          // child: Image.network(
                          //   widget.movieItem.posterPath!,
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('7.3'),
                      Text('/10'),
                    ],
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(32),
                  ),
                  Text('Capitã Marvel'.toUpperCase()),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Titulo original:'),
                      Text('Captain Marvel'),
                    ],
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(32),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: const [
                          Text('Ano:'),
                          Text('2019'),
                        ],
                      ),
                      Row(
                        children: const [
                          Text('Duração:'),
                          Text('1h 20 min'),
                        ],
                      )
                    ],
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(12),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE9ECEF)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: const Text('AÇÃO'),
                      ),
                      SizedBox.fromSize(
                        size: const Size(8, 8),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE9ECEF)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: const Text('AVENTURA'),
                      ),
                      SizedBox.fromSize(
                        size: const Size(8, 8),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFE9ECEF)),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: const Text('SCI-FI'),
                      ),
                    ],
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(56),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Descrição'),
                      SizedBox.fromSize(
                        size: const Size.fromHeight(8),
                      ),
                      const Text(
                        'Aventura sobre Carol Danvers, uma agente da CIA que tem contato com uma raça alienígena e ganha poderes sobre-humanos. Entre os seus poderes estão uma força fora do comum e a habilidade de voar.',
                      ),
                    ],
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(40),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16, bottom: 8, top: 8),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF1F3F5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Text('ORÇAMENTO:'),
                        Text('\$ 152,000,000'),
                      ],
                    ),
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(4),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16, bottom: 8, top: 8),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF1F3F5),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Text('PRODUTORAS:'),
                        Text('MARVEL STUDIOS'),
                      ],
                    ),
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(40),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Diretor'),
                      SizedBox.fromSize(
                        size: const Size.fromHeight(8),
                      ),
                      const Text('Ryan Fleck, Anna Boden'),
                    ],
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(32),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Elenco'),
                      SizedBox.fromSize(
                        size: const Size.fromHeight(8),
                      ),
                      Text(
                          'Brie Larson, Samuel L. Jackson, Ben Mendelsohn, Djimon Hounsou, Lee Pace'),
                    ],
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(90),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
