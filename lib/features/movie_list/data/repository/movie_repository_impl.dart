import 'package:dartz/dartz.dart';
import 'package:movie_app/base/error/failure.dart';
import 'package:movie_app/features/movie_list/domain/entites/movie.dart';
import 'package:movie_app/features/movie_list/domain/entites/movie_details.dart';
import 'package:movie_app/features/movie_list/domain/usecases/get_movie_details_usecase.dart';

import '../../domain/repository/base_movie_repository.dart';
import '../../domain/usecases/get_all_movies_usecase.dart';
import '../datasource/movie_datasource.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getAllMovies(
      {required GetAllMoviesParameters params}) async {
    try {
      return Right(
          await baseMovieRemoteDataSource.getAllMovies(params: params));
    } on Failure catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      {required GetMovieDetailsParameters params}) async {
    try {
      return Right(
          await baseMovieRemoteDataSource.getMovieDetails(params: params));
    } on Failure catch (failure) {
      return Left(ServerFailure(failure.message));
    }
  }
}
