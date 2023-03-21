import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../base/error/failure.dart';
import '../../../../base/usecase/base_usecase.dart';
import '../entites/movie.dart';
import '../repository/base_movie_repository.dart';

class GetAllMoviesUseCase extends BaseUseCase<List<Movie>, GetAllMoviesParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetAllMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(GetAllMoviesParameters parameters) async {
    return await baseMoviesRepository.getAllMovies(params: parameters);
  }
}

class GetAllMoviesParameters extends Equatable {
  final int pageId;
  final String? searchString;

  const GetAllMoviesParameters(this.pageId, this.searchString);

  @override
  List<Object> get props => [pageId];
}
