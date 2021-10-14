

import 'dart:async';

import 'package:flutter_movies/app/data/remote/tmdb/tmdb_client.dart';
import 'package:flutter_movies/app/domain/models.dart';
import 'dart:developer' as developer;
import 'package:flutter_movies/app/data/remote/tmdb/web_models.dart' as web;

abstract class RemoteMovieDataSource {
  Future<List<Movie>> fetchReleases(DateTime releaseDate);
  Future<List<Movie>> fetchPopular();
  Future<List<Movie>> fetchKids();
}

class TMDBMovies implements RemoteMovieDataSource {
  TMDBMovies({
    required TMDBClient client,
  }) : _client = client, super();

  final TMDBClient _client;
  final TMDBEnv _env = TMDBEnv();

  @override
  Future<List<Movie>> fetchReleases(DateTime releaseDate) async {
    final response = await _client.fetchReleases(_env.token!, releaseDate, 1);
    return response.results.map((web.Movie e) => e.toMovie()).toList();
  }

  @override
  Future<List<Movie>> fetchPopular() async {
    final response = await _client.fetchPopular(_env.token!, _popularityDesc, 1);
    return response.results.map((web.Movie e) => e.toMovie()).toList();
  }

  @override
  Future<List<Movie>> fetchKids() async {
    final response = await _client.fetchKids(_env.token!, _country, _rating, _popularityDesc,1);
    return response.results.map((web.Movie e) => e.toMovie()).toList();
  }

  static const _popularityDesc = 'popularity.desc';
  static const _country = 'US';
  static const _rating = 'G';
}

class TMDBEnv {
  TMDBEnv(){
    readFile().then((m){
      _env = m;
      _isReady.complete(true);
    }).onError((Object error, StackTrace stackTrace){
      developer.log('failed to get tmdb setup');
      _isReady.completeError(error,stackTrace);
    });
  }

  late Map<String,String> _env;
  String? get token => _env['TMDB'];

  final Completer<bool> _isReady = Completer<bool>();
  Future<bool> get isReady => _isReady.future;

  Future<Map<String,String>> readFile() async => <String,String>{};
}

extension on web.Movie {
  Movie toMovie() {
    return Movie(
      remoteId: id.toString(),
      title: title,
      overview: overview,
      poster: posterPath,
      backdrop: backdropPath,
      releaseDate: releaseDate,
      popularity: popularity,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}