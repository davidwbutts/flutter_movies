

import 'package:flutter/material.dart';
import 'package:flutter_movies/app/navigation/app_state.dart';
import 'package:flutter_movies/app/ui/kids/kids_screen.dart';
import 'package:flutter_movies/app/ui/popular/popular_screen.dart';
import 'package:flutter_movies/app/ui/recent_release/releases_screen.dart';
import 'package:provider/provider.dart';

class InnerScreenStack extends StatelessWidget {
  const InnerScreenStack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      children: const <Widget>[
        RecentReleaseScreen(),
        PopularMoviesScreen(),
        KidsMoviesScreen(),
      ],
      index: context.watch<BottomBarNotifier>().index,
    );
  }
}