

import 'package:flutter_movies/app/data/local/local_movies_source.dart';
import 'package:flutter_movies/app/data/remote/remote_movies.dart';
import 'package:flutter_movies/app/domain/models.dart';

class MovieRepository {
  const MovieRepository({
    required LocalMovieDataSource local,
    required RemoteMovieDataSource remote,
  }) : _local = local, _remote = remote, super();

  final LocalMovieDataSource _local;
  final RemoteMovieDataSource _remote;


  Future<List<Movie>> getRecentMovies() {
    final now = DateTime.now();
    return _remote.fetchRecentReleases(DateTime(now.year, now.month-1, now.day));
  }

  Future<List<Movie>> getPopularMovies() =>
      _remote.fetchPopular();

  Future<List<Movie>> getKidsMovies() =>
      _remote.fetchKids();
}

