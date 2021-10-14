import 'dart:collection';

import 'package:flutter_movies/app/domain/models.dart';

class PopularMoviesState {
  const PopularMoviesState({
    required List<Movie> movies,
  }) : _movies = movies;

  final List<Movie> _movies;
  List<Movie> get movies => UnmodifiableListView(_movies);

  static const PopularMoviesState empty = PopularMoviesState(movies: []);
}
