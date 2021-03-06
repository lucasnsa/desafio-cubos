import 'package:desafiocubos/modules/movies/models/movie_item.dart';
import 'package:desafiocubos/modules/movies/views/home/movies_home_controller.dart';
import 'package:desafiocubos/modules/movies/views/home/widgets/movie_tile.dart';
import 'package:desafiocubos/modules/movies/views/home/widgets/tabbar_chip.dart';
import 'package:desafiocubos/resources/text_styles.dart';
import 'package:desafiocubos/utils/genre_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class MoviesHomePage extends StatefulWidget {
  const MoviesHomePage({Key? key}) : super(key: key);

  @override
  State<MoviesHomePage> createState() => _MoviesHomePageState();
}

class _MoviesHomePageState extends State<MoviesHomePage>
    with SingleTickerProviderStateMixin {
  final controller = Modular.get<MoviesHomeController>();
  final TextEditingController _searchTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchTextController.addListener(() {
      controller.performSearch(_searchTextController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            titleTextStyle: appBarTitleStyle,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            primary: true,
            pinned: true,
            title: Text(
              'Filmes',
            ),
            elevation: 0,
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(
              child: PreferredSize(
                preferredSize: const Size.fromHeight(110),
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.center,
                          end: FractionalOffset.bottomCenter,
                          colors: <Color>[
                            Colors.white,
                            Colors.white,
                            Colors.white.withOpacity(0),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 47,
                            child: TextField(
                              controller: _searchTextController,
                              decoration: InputDecoration(
                                fillColor: const Color(0xFFF1F3F5),
                                filled: true,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    'assets/icons/search.png',
                                  ),
                                ),
                                hintText: 'Pesquise filmes',
                                hintStyle: searchTermStyle,
                              ),
                            ),
                          ),
                          Observer(
                            builder: (context) {
                              return TabChips(
                                labels: const [
                                  'A????o',
                                  'Aventura',
                                  'Fantasia',
                                  'Com??dia',
                                ],
                                selectedIndex: controller.tabIndex,
                                onChanged: (value) {
                                  controller.tabIndex = value;
                                  final genre = tabToGenreId(value);
                                  controller.changeGenre(genre);
                                  _searchTextController.clear();
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: PagedSliverList.separated(
              builderDelegate: PagedChildBuilderDelegate<MovieItem>(
                itemBuilder: (context, item, index) => MovieTile(
                  movie: item,
                  onTap: () => Modular.to.pushNamed('/detail', arguments: item),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox.fromSize(
                size: const Size.fromHeight(16),
              ),
              pagingController: controller.pagingController,
            ),
          ),
        ],
      ),
    );
  }
}

/// Header permanente usando Sliver
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  _SliverAppBarDelegate({required this.child});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
