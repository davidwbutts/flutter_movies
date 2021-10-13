
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/app/ui/movies/movies_screen.dart';
import 'package:flutter_movies/app/ui/theme/app_theme.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final _routerDelegate = MainRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,   // TODO: convert to change notifier
      routeInformationParser: const SystemRouteParser(),
      routerDelegate: _routerDelegate,
    );
  }
}

class SystemRouteParser extends RouteInformationParser<String> {
  const SystemRouteParser() : super();

  @override
  Future<String> parseRouteInformation(RouteInformation routeInformation) =>
      SynchronousFuture(routeInformation.location ?? '');
}

class MainRouterDelegate extends RouterDelegate<String>
    with ChangeNotifier,PopNavigatorRouterDelegateMixin {

  static final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: const <Page>[
        MaterialPage(child: MoviesScreen()),
      ],
      onPopPage: _onPopPage,
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(String configuration) => SynchronousFuture(null);

  bool _onPopPage(Route<dynamic> route, result) {
    return route.didPop(result);
  }
}