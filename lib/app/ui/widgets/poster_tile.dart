

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movies/app/domain/models.dart';

class PosterTile extends StatelessWidget {
  const PosterTile({Key? key, required this.movie,}) : super(key: key);

  final Movie movie;
  final _imageUrl = 'https://image.tmdb.org/t/p/w500';

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: '$_imageUrl${movie.poster}',
      fit: BoxFit.cover,
    );
  }
}