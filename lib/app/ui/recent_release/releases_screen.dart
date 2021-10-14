import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/app/data/bloc/recent_movies/bloc.dart';
import 'package:flutter_movies/app/domain/models.dart';
import 'package:flutter_movies/app/injection/dependency_injection.dart';

class RecentReleaseScreen extends StatelessWidget {
  const RecentReleaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RecentMoviesBloc>(),
      child: Builder(builder: (context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final bloc = BlocProvider.of<RecentMoviesBloc>(context);
    return BlocBuilder<RecentMoviesBloc, RecentMoviesState>(
      builder: (context, state) {
        final movies = state.movies;
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
    return Container(
      alignment: Alignment.center,
      color: Colors.teal[100],
      child: Text(movie.title),
    );
  }
}