
import 'package:flutter_movies/app/injection/base_injection.dart';

class DevelopmentInjection extends BaseInjection {

  @override
  void register() {
    super.register();
    _register();
  }

  /// Register class implementations here that are unique to development builds
  void _register() {
    // bloc
    // repositories
    // local data sources
    // remote data sources
  }
}