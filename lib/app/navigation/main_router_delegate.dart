import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/app/ui/main/main_screen.dart';

class MainRouterDelegate extends RouterDelegate<String>
    with ChangeNotifier,PopNavigatorRouterDelegateMixin {

  static final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: const <Page>[
        MaterialPage(
            child: MainScreen(),
        ),
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