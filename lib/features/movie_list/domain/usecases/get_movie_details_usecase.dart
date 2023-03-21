import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../base/error/failure.dart';
import '../../../../base/usecase/base_usecase.dart';
import '../entites/movie_details.dart';
import '../repository/base_movie_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, GetMovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(GetMovieDetailsParameters parameters) async {
    return await baseMoviesRepository.getMovieDetails(params: parameters);
  }
}

class GetMovieDetailsParameters extends Equatable {
  final String imdbID;

  const GetMovieDetailsParameters({required this.imdbID});

  @override
  List<Object> get props => [imdbID];
}
