import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies;

  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: .8,
        autoplay: true,
        scale: .9,
        pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
                activeColor: colors.primary, color: colors.secondary)),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return _Slide(movie: movie);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;

  const _Slide({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(color: Colors.black45, blurRadius: 10, offset: Offset(0, 10)),
      ],
    );
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          // child: Text('${movie.backdropPath}'),
          child: Image.network(
            // movie.backdropPath,
            // "https://image.tmdb.org/t/p/w500/5VYqB2T9L0WetvN9Bxk3Wg4vKoJ.jpg",
            "https://th.bing.com/th/id/OIP.vQ4f_Y6R5Qwg8pkvO_b-dgHaEe?rs=1&pid=ImgDetMain",
            fit: BoxFit.cover,

            loadingBuilder: (context, child, loadingProgress) {
              // if (loadingProgress != null) {
              //   return const DecoratedBox(
              //       decoration: BoxDecoration(color: Colors.black12));
              // }

              return FadeIn(child: child);
            },
          ),
        ),
      ),
    );
  }
}
