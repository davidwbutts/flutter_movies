
import 'package:flutter/foundation.dart';
import 'package:flutter_movies/app/injection/dependency_injection.dart';
import 'package:flutter_movies/app/navigation/app_state.dart';

/// Base level injection using [GetIt] service locator.
/// Register class implementations here that are common to all builds.
abstract class BaseInjection {

  /// register class implementations that are common for all builds
  @mustCallSuper
  void register() {
    // navigation
    getIt.registerLazySingleton<AppState>(() => AppState());

    // bloc

    // repositories

    // local data sources

    // remote data sources

  }
}