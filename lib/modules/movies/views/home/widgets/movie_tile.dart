import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafiocubos/modules/movies/models/movie_item.dart';
import 'package:desafiocubos/resources/text_styles.dart';
import 'package:desafiocubos/utils/genre_list.dart';
import 'package:flutter/material.dart';

class MovieTile extends StatelessWidget {
  final VoidCallback onTap;
  final MovieItem movie;
  const MovieTile({Key? key, required this.movie, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: movie.posterPath ?? '',
        placeholderFadeInDuration: const Duration(milliseconds: 888),
        fadeInDuration: const Duration(milliseconds: 888),
        fadeOutDuration: const Duration(milliseconds: 888),
        imageBuilder: (context, imageProvider) {
          return Hero(
            tag: movie.posterPath ?? movie.id,
            child: Container(
              width: 320.0,
              height: 470.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: imageProvider,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                color: Colors.grey,
              ),
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(bottom: 32.0, left: 24),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.center,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.43),
                      Colors.black.withOpacity(1),
                    ],
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      movie.title,
                      style: movieItemTitleStyle,
                    ),
                    SizedBox.fromSize(
                      size: const Size.fromHeight(12),
                    ),
                    Text(
                      movie.genres.map((e) => getGenreNameById(e)).join(' - '),
                      style: movieItemGenresStyle,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        // progressIndicatorBuilder: (context, url, progress) {
        //   return Container(
        //     width: 320.0,
        //     height: 470.0,
        //     decoration: const BoxDecoration(
        //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
        //       color: Colors.black12,
        //     ),
        //     child: const Center(child: CircularProgressIndicator.adaptive()),
        //   );
        // // },
      ),
    );
  }
}
