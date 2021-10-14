

import 'package:flutter/material.dart';
import 'package:flutter_movies/app/navigation/app_state.dart';
import 'package:provider/provider.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.movie_creation_outlined), label: 'New'),
        BottomNavigationBarItem(icon: Icon(Icons.star_outline), label: 'Popular'),
        BottomNavigationBarItem(icon: Icon(Icons.toys_outlined), label: 'Kids'),
      ],
      currentIndex: context.watch<BottomBarNotifier>().index,
      onTap: (index)=>context.read<BottomBarNotifier>().index = index,
    );
  }
}