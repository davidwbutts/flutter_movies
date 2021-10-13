
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_movies/app/domain/models.dart';

class MovieSearch extends SearchDelegate<Movie?> {
  MovieSearch({
    required List<Movie> movies,
  }) :  _movies = UnmodifiableListView(movies),
        super();

  final UnmodifiableListView<Movie> _movies;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.cancel),
        onPressed: (){ query = ''; },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: ()=> close(context,null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = _matchQuery();
    if(results == null) {
      return const Center(
          child: Text('No matching movie titles were found.'),
      );
    }
    final theme = Theme.of(context);
    return ListView.builder(
      itemBuilder: (context,index){
        final item = _movies[index];
        return ListTile(
          title: Text(item.title, style: theme.textTheme.subtitle1),
          onTap: (){ close(context,item); },
        );
      },
      itemCount: results.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = _matchQuery();

    final theme = Theme.of(context);
    return ListView.builder(
      itemBuilder: (context,index){
        final item = _movies[index];
        return ListTile(
          title: Text(item.title, style: theme.textTheme.subtitle1),
          onTap: (){ close(context,item); },
        );
      },
      itemCount: results?.length ?? 0,
    );
  }

  Iterable<Movie>? _matchQuery() {
    final q = query.toLowerCase();
    return _movies.where((e)=>e.title.toLowerCase().contains(q));
  }
}