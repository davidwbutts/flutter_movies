


import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/app/data/bloc/recent_movies/bloc.dart';
import 'package:flutter_movies/app/domain/models.dart';
import 'package:flutter_movies/app/injection/dependency_injection.dart';
import 'package:flutter_movies/app/ui/widgets/movie_detail.dart';
import 'package:flutter_movies/app/ui/widgets/poster_tile.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RecentMoviesBloc>(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
      builder: (context, state) {
        final movies = state.movies;
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Popular'),
              centerTitle: true,
              floating: true,
              snap: true,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
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
                    (context,index) => _buildItem(context,movies[index]),
                childCount: movies.length,
              ),
            )
          ],
        );
      },
    );
  }


  Widget _buildItem(BuildContext context, Movie movie) {
    return OpenContainer(
      openBuilder: (BuildContext context, void Function({Object? returnValue}) action) => MovieDetail(movie: movie),
      closedBuilder: (BuildContext context, void Function() action) => PosterTile(movie: movie),
      useRootNavigator: true,
    );
  }
}