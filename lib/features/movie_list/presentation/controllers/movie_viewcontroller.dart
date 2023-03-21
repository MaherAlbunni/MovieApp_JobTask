import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_app/base/controller/appbase_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../domain/entites/movie.dart';
import '../../domain/usecases/get_all_movies_usecase.dart';

class MovieViewController extends GetxController with StateMixin<List<Movie>> {
  AppBaseController appBaseController = Get.find();
  final GetAllMoviesUseCase getAllMoviesUseCase;
  final searchPressed = false.obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  int pageId = 1;
  TextEditingController searchTextController = TextEditingController();
  List<Movie> allMovies = [];
  String? searchText;

  MovieViewController(this.getAllMoviesUseCase);

  @override
  void onInit() {
    super.onInit();
    getAllMovies();
  }

  getAllMovies({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      allMovies.clear();
      // searchText = null;
      pageId = 1;
      change(allMovies, status: RxStatus.loading());
    } else {
      pageId += 1;
      refreshController.requestLoading();
    }
    (await appBaseController.futureWrapper(
      () => getAllMoviesUseCase(GetAllMoviesParameters(pageId, searchText)),
    ))
        .fold(
      (l) {
        change(allMovies, status: RxStatus.error(l.message));
      },
      (r) {
        allMovies.addAll(r);
        if (!isLoadMore) {
          change(allMovies, status: RxStatus.success());
        } else {
          refreshController.loadComplete();
          change(allMovies, status: RxStatus.success());
        }
      },
    );
  }
}
