import 'package:movie_app/features/movie_list/domain/entites/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.title,
    required super.year,
    required super.poster,
    required super.imdbID,
    required super.type,
    required super.released,
    required super.runtime,
    required super.genre,
    required super.language,
    required super.country,
    required super.imdbRating,
    required super.boxOffice,
    required super.awards,
    required super.plot,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        type: json["Type"],
        title: json["Title"],
        year: json["Year"],
        poster: json["Poster"],
        imdbID: json["imdbID"],
        country: json["Country"],
        boxOffice: json["BoxOffice"],
        genre: json["Genre"],
        imdbRating: json["imdbRating"],
        language: json["Language"],
        released: json["Released"],
        runtime: json["Runtime"],
        awards: json["Awards"],
        plot: json["Plot"],
      );
}
