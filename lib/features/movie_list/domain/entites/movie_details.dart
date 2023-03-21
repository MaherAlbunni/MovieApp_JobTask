import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final String title;
  final String year;
  final String poster;
  final String type;
  final String imdbID;
  final String released;
  final String runtime;
  final String genre;
  final String language;
  final String country;
  final String imdbRating;
  final String? boxOffice;
  final String awards;
  final String plot;

  const MovieDetails({
    required this.released,
    required this.runtime,
    required this.genre,
    required this.language,
    required this.country,
    required this.imdbRating,
    this.boxOffice,
    required this.title,
    required this.year,
    required this.poster,
    required this.type,
    required this.imdbID,
    required this.awards,
    required this.plot,
  });

  @override
  List<Object> get props => [
        title,
        year,
        poster,
        type,
        imdbID,
        released,
        runtime,
        genre,
        language,
        country,
        imdbRating,
        awards,
        plot,
      ];
}
