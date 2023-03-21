import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String errorMessage;
  final String response;

  const ErrorMessageModel({
    required this.errorMessage,
    required this.response,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      errorMessage: json["Error"],
      response: json["Response"],
    );
  }

  @override
  List<Object?> get props => [
    errorMessage,
    response,
  ];
}