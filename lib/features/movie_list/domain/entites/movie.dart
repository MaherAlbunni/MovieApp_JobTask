import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String title;
  final String year;
  final String poster;
  final String type;
  final String imdbID;

  const Movie({
    required this.title,
    required this.year,
    required this.poster,
    required this.type,
    required this.imdbID,
  });

  @override
  List<Object> get props => [
    title,
    year,
    poster,
    type,
    imdbID,
  ];
}