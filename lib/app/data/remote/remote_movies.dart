

import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movies/app/data/remote/tmdb/tmdb_client.dart';
import 'package:flutter_movies/app/domain/models.dart';
import 'dart:developer' as developer;
import 'package:flutter_movies/app/data/remote/tmdb/web_models.dart' as web;

abstract class RemoteMovieDataSource {
  Future<List<Movie>> fetchRecentReleases(DateTime releaseDate);
  Future<List<Movie>> fetchPopular();
  Future<List<Movie>> fetchKids();
}

class TMDBMovieDataSource implements RemoteMovieDataSource {
  TMDBMovieDataSource({
    required TMDBClient client,
  }) : _client = client, super();

  final TMDBClient _client;

  String get _token => dotenv.env['TMDB'] ?? '';

  @override
  Future<List<Movie>> fetchRecentReleases(DateTime releaseDate) async {
    final response = await _client.fetchReleases(_token, releaseDate, 1);
    return response.results.map((web.Movie e) => e.toMovie()).toList();
  }

  @override
  Future<List<Movie>> fetchPopular() async {
    final response = await _client.fetchPopular(_token, _popularityDesc, 1);
    return response.results.map((web.Movie e) => e.toMovie()).toList();
  }

  @override
  Future<List<Movie>> fetchKids() async {
    final response = await _client.fetchKids(_token, _country, _rating, _popularityDesc,1);
    return response.results.map((web.Movie e) => e.toMovie()).toList();
  }

  static const _popularityDesc = 'popularity.desc';
  static const _country = 'US';
  static const _rating = 'G';
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