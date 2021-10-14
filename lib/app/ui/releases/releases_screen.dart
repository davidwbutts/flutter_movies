

import 'package:flutter/material.dart';

class ReleasesScreen extends StatelessWidget {
  const ReleasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text('Releases'),
          centerTitle: true,
          floating: true,
          snap: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: (){},
            ),
          ],
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.66,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          delegate: SliverChildBuilderDelegate(
            _buildItem,
            childCount: 20,
          ),
        )
      ],
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return Container(
      alignment: Alignment.center,
      color: Colors.teal[100 * (index % 9)],
      child: Text('grid item $index'),
    );
  }
}