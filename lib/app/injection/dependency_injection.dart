import 'package:get_it/get_it.dart';
import 'package:flutter_movies/app/injection/development_injection.dart';
import 'package:flutter_movies/app/injection/production_injection.dart';

final getIt = GetIt.instance;

abstract class DependencyInjection {
  static void dev() => DevelopmentInjection().register();
  static void prod() => ProductionInjection().register();
}







