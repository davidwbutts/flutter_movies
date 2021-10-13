
import 'package:flutter/foundation.dart';

/// Base level injection using [GetIt] service locator.
/// Register class implementations here that are common to all builds.
abstract class BaseInjection {

  /// register class implementations that are common for all builds
  @mustCallSuper
  void register() {
    // bloc
    // repositories
    // local data sources
    // remote data sources
  }
}