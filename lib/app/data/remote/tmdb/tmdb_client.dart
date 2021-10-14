
import 'package:flutter_movies/app/data/remote/tmdb/web_models.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'tmdb_client.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3/')
abstract class TMDBClient {
  factory TMDBClient(Dio dio, {String baseUrl}) = _TMDBClient;

  @GET('/discover/movie')
  Future<TMDBResponse> fetchReleases(
      @Query("api_key") String apiKey,
      @Query("primary_release_date.gte") DateTime releaseDate,
      @Query("page") int page,
      );

  @GET('/discover/movie')
  Future<TMDBResponse> fetchPopular(
      @Query("api_key") String apiKey,
      @Query("sort_by") String sort,
      @Query("page") int page,
      );

  @GET('/discover/movie')
  Future<TMDBResponse> fetchKids(
      @Query('api_key') String apiKey,
      @Query('certification_country') String country,
      @Query('certification_order.lte') String rating,
      @Query('sort_by') String sort,
      @Query('page') int page,
      );

  // TODO: queries are all flavors of the same api endpoint using different params; consider combining
}

extension on DateTime {
  String toJson() =>
      '${year.toString().padLeft(4, '0')}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
}

// https://api.themoviedb.org/3/discover/movie?primary_release_date.gte=2021-10-01
// https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc
// https://api.themoviedb.org/3/discover/movie?certification_country=US&certification.lte=G&sort_by=popularity.desc