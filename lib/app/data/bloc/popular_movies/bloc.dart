
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/app/data/bloc/popular_movies/event.dart';
import 'package:flutter_movies/app/data/bloc/popular_movies/state.dart';
import 'package:flutter_movies/app/data/repositories/movie_respository.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc({
    required MovieRepository repository,
  }) : _repository = repository, super(PopularMoviesState.empty) {
    _repository.getPopularMovies().then((list){
      add(PopularMoviesUpdate(movies: list));
    }).onError((error, stackTrace){

    });
  }

  final MovieRepository _repository;

  @override
  Stream<PopularMoviesState> mapEventToState(PopularMoviesEvent event) async* {
    if (event is PopularMoviesUpdate) {
      yield* handleUpdate(event);
    } else if(event is RefreshPopularMovies) {
      yield* refreshMovies(event);
    }
  }

  Stream<PopularMoviesState> handleUpdate(PopularMoviesUpdate event) async* {
    final movies = await _repository.getPopularMovies();
    yield PopularMoviesState(movies: movies);
  }

  Stream<PopularMoviesState> refreshMovies(RefreshPopularMovies event) async* {
    final movies = await _repository.getPopularMovies();
    yield PopularMoviesState(movies: movies);
  }

}





