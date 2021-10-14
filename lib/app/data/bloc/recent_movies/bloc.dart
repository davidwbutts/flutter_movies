import 'dart:collection';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/app/data/repositories/movie_respository.dart';
import 'package:flutter_movies/app/domain/models.dart';


class RecentMoviesBloc extends Bloc<RecentMoviesEvent, RecentMoviesState> {
  RecentMoviesBloc({
    required MovieRepository repository,
  }) : _repository = repository, super(RecentMoviesState.empty) {
    _repository.getRecentMovies().then((list){
      add(RecentMoviesUpdate(movies: list));
    }).onError((error, stackTrace){

    });
  }

  final MovieRepository _repository;

  @override
  Stream<RecentMoviesState> mapEventToState(RecentMoviesEvent event) async* {
    if (event is RecentMoviesUpdate) {
      yield* handleUpdate(event);
    } else if(event is RefreshRecentMovies) {
      yield* refreshMovies(event);
    }
  }

  Stream<RecentMoviesState> handleUpdate(RecentMoviesUpdate event) async* {
    final movies = await _repository.getRecentMovies();
    yield RecentMoviesState(movies: movies);
  }

  Stream<RecentMoviesState> refreshMovies(RefreshRecentMovies event) async* {
    final movies = await _repository.getRecentMovies();
    yield RecentMoviesState(movies: movies);
  }

}

abstract class RecentMoviesEvent {}

class RecentMoviesUpdate implements RecentMoviesEvent {
  const RecentMoviesUpdate({required this.movies}) : super();

  final List<Movie> movies;
}

class RefreshRecentMovies implements RecentMoviesEvent {
  const RefreshRecentMovies() : super();
}

class RecentMoviesState {
  const RecentMoviesState({
    required List<Movie> movies,
  }) : _movies = movies;

  final List<Movie> _movies;
  List<Movie> get movies => UnmodifiableListView(_movies);

  static const RecentMoviesState empty = RecentMoviesState(movies: []);
}