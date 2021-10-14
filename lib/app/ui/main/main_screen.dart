

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/app/injection/dependency_injection.dart';
import 'package:flutter_movies/app/navigation/app_state.dart';
import 'package:flutter_movies/app/navigation/inner_router_delegate.dart';
import 'package:flutter_movies/app/ui/main/main_navigation_bar.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final _routerDelegate = InnerRouterDelegate();
  BackButtonDispatcher? _childBackButtonDispatcher;

  @override
  void didChangeDependencies() {
    _childBackButtonDispatcher =
        Router.of(context).backButtonDispatcher?.createChildBackButtonDispatcher();
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: getIt<AppState>().bottomBarNotifier,
      child: Scaffold(
        body: Router(
          routerDelegate: _routerDelegate,
          backButtonDispatcher: _childBackButtonDispatcher,
        ),
        bottomNavigationBar: const MainNavigationBar(),
      ),
    );
  }
}









