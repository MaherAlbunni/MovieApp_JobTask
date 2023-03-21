import 'package:get_it/get_it.dart';
import 'package:movie_app/features/movie_list/domain/usecases/get_all_movies_usecase.dart';
import 'package:movie_app/features/movie_list/domain/usecases/get_movie_details_usecase.dart';

import '../../features/movie_list/data/datasource/movie_datasource.dart';
import '../../features/movie_list/data/repository/movie_repository_impl.dart';
import '../../features/movie_list/domain/repository/base_movie_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Use Cases
    sl.registerLazySingleton(() => GetAllMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailsUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(
        () => MoviesRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
