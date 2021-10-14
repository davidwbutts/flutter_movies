
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/app/navigation/inner_screen_stack.dart';

class InnerRouterDelegate extends RouterDelegate<String>
    with ChangeNotifier,PopNavigatorRouterDelegateMixin {

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: const <Page>[
        MaterialPage(child: InnerScreenStack()),
      ],
      onPopPage: _onPopPage,
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  Future<void> setNewRoutePath(String configuration) =>
      SynchronousFuture(null);

  bool _onPopPage(Route<dynamic> route, result) {
    return route.didPop(result);
  }
}
