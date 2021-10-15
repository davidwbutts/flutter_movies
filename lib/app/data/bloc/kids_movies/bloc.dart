
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movies/app/data/bloc/kids_movies/event.dart';
import 'package:flutter_movies/app/data/bloc/kids_movies/state.dart';
import 'package:flutter_movies/app/data/repositories/movie_respository.dart';

class KidsMoviesBloc extends Bloc<KidsMoviesEvent, KidsMoviesState> {
  KidsMoviesBloc({
    required MovieRepository repository,
  }) : _repository = repository, super(KidsMoviesState.empty) {
    _repository.getKidsMovies().then((list){
      add(KidsMoviesUpdate(movies: list));
    }).onError((error, stackTrace){

    });
  }

  final MovieRepository _repository;

  @override
  Stream<KidsMoviesState> mapEventToState(KidsMoviesEvent event) async* {
    if (event is KidsMoviesUpdate) {
      yield* handleUpdate(event);
    } else if(event is RefreshKidsMovies) {
      yield* refreshMovies(event);
    }
  }

  Stream<KidsMoviesState> handleUpdate(KidsMoviesUpdate event) async* {
    final movies = await _repository.getKidsMovies();
    yield KidsMoviesState(movies: movies);
  }

  Stream<KidsMoviesState> refreshMovies(RefreshKidsMovies event) async* {
    final movies = await _repository.getKidsMovies();
    yield KidsMoviesState(movies: movies);
  }

}