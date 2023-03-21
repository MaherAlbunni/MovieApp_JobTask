
import 'package:dartz/dartz.dart';

import '../../../../base/error/failure.dart';
import '../entites/movie.dart';
import '../entites/movie_details.dart';
import '../usecases/get_all_movies_usecase.dart';
import '../usecases/get_movie_details_usecase.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getAllMovies({required GetAllMoviesParameters params});

  Future<Either<Failure, MovieDetails>> getMovieDetails({required GetMovieDetailsParameters params});
}