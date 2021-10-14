import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/app/domain/models.dart';

class MovieDetail extends StatelessWidget {
  const MovieDetail({Key? key, required this.movie,}) : super(key: key);

  final Movie movie;
  final _imageUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: '$_imageUrl${movie.poster}',
            width: size.width,
            height: min(size.height, size.width),
            fit: BoxFit.cover,
          ),
          Padding(
            key: const ValueKey('title'),
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text(movie.title, style: theme.textTheme.headline5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(movie.overview, style: theme.textTheme.bodyText1),
          ),
        ],
      ),

    );
  }
}