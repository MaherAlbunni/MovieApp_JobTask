import 'package:get/get.dart';
import 'package:movie_app/base/controller/appbase_controller.dart';
import 'package:movie_app/features/movie_list/domain/usecases/get_movie_details_usecase.dart';

import '../../domain/entites/movie_details.dart';

class MovieDetailsViewController extends GetxController
    with StateMixin<MovieDetails> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final String imdbID = Get.arguments;

  MovieDetailsViewController(this.getMovieDetailsUseCase);

  AppBaseController appBaseController = Get.find();
  MovieDetails? movieDetails;

  @override
  void onInit() {
    super.onInit();
    getMovieDetails();
  }

  getMovieDetails() async {
    change(movieDetails, status: RxStatus.loading());
    (await appBaseController.futureWrapper(
            () => getMovieDetailsUseCase(
                GetMovieDetailsParameters(imdbID: imdbID)),
            // loadingValue: isLoadingDetails
    ))
        .fold((l) {
      change(movieDetails, status: RxStatus.error(l.message));
    }, (r) {
      movieDetails = r;
      change(movieDetails, status: RxStatus.success());
    });
  }
}
