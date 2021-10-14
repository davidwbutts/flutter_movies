
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/app/navigation/main_router_delegate.dart';
import 'package:flutter_movies/app/navigation/system_route_parser.dart';
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



