

import 'package:flutter_movies/app/domain/models.dart';

class MovieRepository {
  const MovieRepository({
    required LocalDataSource local,
    required RemoteDataSource remote,
  }) : _local = local, _remote = remote, super();

  final LocalDataSource _local;
  final RemoteDataSource _remote;

  Future<List<Movie>> getRecentMovies() =>
      throw UnimplementedError();

  Future<List<Movie>> getPopularMovies() =>
      throw UnimplementedError();
}


abstract class LocalDataSource {}

abstract class RemoteDataSource {}