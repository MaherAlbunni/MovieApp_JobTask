import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstance {
  static String listAllMovies({String? searchString, int pageId = 1}) =>
      "${dotenv.env["BASE_URL"]}?apikey=${dotenv.env["API_KEY"]}&s=${searchString ?? "movie"}&page=$pageId";
  
  static String getMovieDetails({required String imdbID}) =>
      "${dotenv.env["BASE_URL"]}?apikey=${dotenv.env["API_KEY"]}&i=$imdbID";
}
