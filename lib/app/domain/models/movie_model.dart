

import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  const Movie({
    this.id = -1,
    required this.remoteId,
    required this.title,
    required this.overview,
    this.poster,
    this.backdrop,
    required this.releaseDate,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
  }) : super();

  final int id;
  final String remoteId;
  final String title;
  final String overview;
  final String? poster;
  final String? backdrop;
  final DateTime releaseDate;
  final double popularity;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [remoteId, title, overview, poster, backdrop, releaseDate, popularity, voteAverage, voteCount];

}