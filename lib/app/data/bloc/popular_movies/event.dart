import 'package:flutter_movies/app/domain/models.dart';

abstract class PopularMoviesEvent {}

class PopularMoviesUpdate implements PopularMoviesEvent {
  const PopularMoviesUpdate({required this.movies}) : super();

  final List<Movie> movies;
}

class RefreshPopularMovies implements PopularMoviesEvent {
  const RefreshPopularMovies() : super();
}