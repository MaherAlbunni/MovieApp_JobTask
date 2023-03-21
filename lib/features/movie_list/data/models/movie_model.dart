import '../../domain/entites/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.title,
    required super.year,
    required super.poster,
    required super.imdbID,
    required super.type,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    type: json["Type"],
    title: json["Title"],
    year: json["Year"],
    poster: json["Poster"],
    imdbID: json["imdbID"],
  );
}
