import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafiocubos/modules/movies/models/movie_detail.dart';
import 'package:desafiocubos/modules/movies/models/movie_item.dart';
import 'package:desafiocubos/modules/movies/views/detail/movie_detail_controller.dart';
import 'package:desafiocubos/utils/dutarion_convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieItem movieItem;
  const MovieDetailPage({Key? key, required this.movieItem}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final controller = Modular.get<MovieDetailController>();
  MovieDetail? _movieDetail;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      _movieDetail = await controller.getDetail(widget.movieItem.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    // _movieDetail = await controller.getDetail(widget.movieItem.id);
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
                  Observer(
                    builder: (context) {
                      if (controller.isLoading) {
                        return const CircularProgressIndicator.adaptive();
                      } else {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(_movieDetail?.voteAverage.toString() ??
                                'Sem nota'),
                            const Text('/10'),
                          ],
                        );
                      }
                    },
                  ),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(32),
                  ),
                  Text(widget.movieItem.title.toUpperCase()),
                  SizedBox.fromSize(
                    size: const Size.fromHeight(12),
                  ),
                  Observer(
                    builder: (context) {
                      if (controller.isLoading) {
                        return const CircularProgressIndicator.adaptive();
                      } else {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Titulo original: '),
                                Text(
                                  _movieDetail?.origialTitle ??
                                      widget.movieItem.title,
                                ),
                              ],
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(32),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    const Text('Ano: '),
                                    Text(
                                      _movieDetail?.releaseDate.year
                                              .toString() ??
                                          'Sem data',
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('Duração: '),
                                    Text(
                                      formatDuration(
                                        _movieDetail?.runtime ?? 0,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(12),
                            ),
                            Wrap(
                              alignment: WrapAlignment.center,
                              spacing: 8,
                              children: [
                                ..._movieDetail!.genres
                                    .map<Widget>(
                                      (e) => Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xFFE9ECEF),
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(5),
                                          ),
                                        ),
                                        child: Text(e.name.toUpperCase()),
                                      ),
                                    )
                                    .toList(),
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
                                Text(
                                  _movieDetail?.overview ?? 'Sem descrição',
                                ),
                              ],
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(40),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                left: 16,
                                bottom: 8,
                                top: 8,
                              ),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF1F3F5),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text('ORÇAMENTO: '),
                                  Text('\$ ${_movieDetail?.budget}'),
                                ],
                              ),
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(4),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                left: 16,
                                bottom: 8,
                                top: 8,
                                right: 16,
                              ),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF1F3F5),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              width: double.infinity,
                              child: Wrap(
                                spacing: 8,
                                children: [
                                  const Text('PRODUTORAS: '),
                                  ..._movieDetail!.companies
                                      .map<Widget>((e) => Text(e)),
                                ],
                              ),
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(40),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Diretor'),
                                SizedBox.fromSize(
                                  size: const Size.fromHeight(8),
                                ),
                                Text(
                                  _movieDetail?.crew.join(', ') ?? '',
                                ),
                              ],
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(32),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Elenco'),
                                SizedBox.fromSize(
                                  size: const Size.fromHeight(8),
                                ),
                                Text(
                                  _movieDetail?.cast.join(', ') ?? '',
                                ),
                              ],
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(90),
                            ),
                          ],
                        );
                      }
                    },
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
