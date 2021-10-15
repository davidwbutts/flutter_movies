
import 'package:flutter/foundation.dart';
import 'package:flutter_movies/app/data/bloc/kids_movies/bloc.dart';
import 'package:flutter_movies/app/data/bloc/popular_movies/bloc.dart';
import 'package:flutter_movies/app/data/bloc/recent_movies/bloc.dart';
import 'package:flutter_movies/app/data/local/local_movies_source.dart';
import 'package:flutter_movies/app/data/remote/remote_movies.dart';
import 'package:flutter_movies/app/data/remote/tmdb/tmdb_client.dart';
import 'package:flutter_movies/app/data/repositories/movie_respository.dart';
import 'package:flutter_movies/app/injection/dependency_injection.dart';
import 'package:flutter_movies/app/navigation/app_state.dart';
import 'package:dio/dio.dart';

/// Base level injection using [GetIt] service locator.
/// Register class implementations here that are common to all builds.
abstract class BaseInjection {

  /// register class implementations that are common for all builds
  @mustCallSuper
  void register() {
    // navigation
    getIt.registerLazySingleton<AppState>(() => AppState());

    // bloc
    getIt.registerFactory<RecentMoviesBloc>(()=>RecentMoviesBloc(repository: getIt<MovieRepository>()));
    getIt.registerFactory<PopularMoviesBloc>(()=>PopularMoviesBloc(repository: getIt<MovieRepository>()));
    getIt.registerFactory<KidsMoviesBloc>(()=>KidsMoviesBloc(repository: getIt<MovieRepository>()));

    // repositories
    getIt.registerLazySingleton<MovieRepository>(() => MovieRepository(local: getIt<LocalMovieDataSource>(), remote: getIt<RemoteMovieDataSource>()));

    // local data sources
    getIt.registerLazySingleton<LocalMovieDataSource>(() => LocalMovieDataSourceImpl());

    // remote data sources
    getIt.registerLazySingleton<RemoteMovieDataSource>(() => TMDBMovieDataSource(client: getIt<TMDBClient>()));
    getIt.registerLazySingleton<TMDBClient>(() => TMDBClient(getIt<Dio>()));
    getIt.registerFactory<Dio>(()=>Dio());
  }
}