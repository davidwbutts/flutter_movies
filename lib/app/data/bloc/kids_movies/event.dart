import 'package:flutter_movies/app/domain/models.dart';

abstract class KidsMoviesEvent {}

class KidsMoviesUpdate implements KidsMoviesEvent {
  const KidsMoviesUpdate({required this.movies}) : super();

  final List<Movie> movies;
}

class RefreshKidsMovies implements KidsMoviesEvent {
  const RefreshKidsMovies() : super();
}