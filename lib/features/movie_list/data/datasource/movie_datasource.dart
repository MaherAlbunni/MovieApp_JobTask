import 'package:dio/dio.dart';
import 'package:movie_app/base/error/failure.dart';
import 'package:movie_app/features/movie_list/domain/entites/movie_details.dart';

import '../../../../base/networks/api_constants.dart';
import '../../../../base/networks/error_model.dart';
import '../../domain/usecases/get_all_movies_usecase.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../models/movie_details_model.dart';
import '../models/movie_model.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getAllMovies(
      {required GetAllMoviesParameters params});

  Future<MovieDetails> getMovieDetails(
      {required GetMovieDetailsParameters params});
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getAllMovies(
      {required GetAllMoviesParameters params}) async {
    final response = await Dio().get(ApiConstance.listAllMovies(
        pageId: params.pageId, searchString: params.searchString));
    if (response.data["Response"].toLowerCase() == 'true') {
      return List<MovieModel>.from((response.data["Search"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerFailure(
        ErrorMessageModel.fromJson(response.data).errorMessage,
      );
    }
  }

  @override
  Future<MovieDetails> getMovieDetails(
      {required GetMovieDetailsParameters params}) async {
    final response =
        await Dio().get(ApiConstance.getMovieDetails(imdbID: params.imdbID));
    if (response.data["Response"].toLowerCase() == 'true') {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerFailure(
        ErrorMessageModel.fromJson(response.data).errorMessage,
      );
    }
  }
}
