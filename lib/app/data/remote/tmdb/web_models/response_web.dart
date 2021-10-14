
import 'package:flutter_movies/app/data/remote/tmdb/web_models/movie_web.dart';

class TMDBResponse {
  TMDBResponse({
    this.page = 0,
    this.results = const <Movie>[],
    this.totalPages = 0,
    this.totalResults = 0,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory TMDBResponse.fromJson(Map<String, dynamic> json) => TMDBResponse(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

