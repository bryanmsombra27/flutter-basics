import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB movie) => Movie(
        adult: movie.adult,
        backdropPath: (movie.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
            : 'https://cdn4.vectorstock.com/i/1000x1000/15/03/page-not-found-sign-vector-14151503.jpg',
        genreIds: movie.genreIds.map((e) => e.toString()).toList(),
        id: movie.id,
        originalLanguage: movie.originalLanguage,
        originalTitle: movie.originalTitle,
        overview: movie.overview,
        popularity: movie.popularity,
        posterPath: movie.posterPath != ""
            ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
            : 'https://cdn4.vectorstock.com/i/1000x1000/15/03/page-not-found-sign-vector-14151503.jpg',
        releaseDate: movie.releaseDate,
        title: movie.title,
        video: movie.video,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount,
      );

  static Movie movieDetailsEntitty(MovieDetails movie) => Movie(
        adult: movie.adult,
        backdropPath: (movie.backdropPath != '')
            ? 'https://image.tmdb.org/t/p/w500${movie.backdropPath}'
            : 'https://cdn4.vectorstock.com/i/1000x1000/15/03/page-not-found-sign-vector-14151503.jpg',
        genreIds: movie.genres.map((e) => e.name).toList(),
        id: movie.id,
        originalLanguage: movie.originalLanguage,
        originalTitle: movie.originalTitle,
        overview: movie.overview,
        popularity: movie.popularity,
        posterPath: movie.posterPath != ""
            ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
            : 'https://cdn4.vectorstock.com/i/1000x1000/15/03/page-not-found-sign-vector-14151503.jpg',
        releaseDate: movie.releaseDate,
        title: movie.title,
        video: movie.video,
        voteAverage: movie.voteAverage,
        voteCount: movie.voteCount,
      );
}
