import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/features/movie_list/presentation/controllers/movie_details_viewcontroller.dart';
import 'package:movie_app/features/movie_list/presentation/controllers/movie_viewcontroller.dart';
import 'package:movie_app/features/movie_list/presentation/screens/movie_details_screen.dart';
import 'package:movie_app/features/movie_list/presentation/widgets/loading_shimmer.dart';
import 'package:movie_app/features/movie_list/presentation/widgets/movie_list_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../../base/services/service_locator.dart';

class MoviesScreen extends GetView<MovieViewController> {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Obx(() => !controller.searchPressed.value
                  ? const Text(
                      "Choose Your Favorite Movie",
                      style: TextStyle(color: Colors.black),
                    )
                  : _searchTextField()),
              actions: [
                Obx(() => !controller.searchPressed.value
                    ? IconButton(
                        icon: const Icon(Icons.search, color: Colors.black),
                        onPressed: () {
                          controller.searchPressed(true);
                        })
                    : IconButton(
                        icon: const Icon(Icons.clear, color: Colors.black),
                        onPressed: () {
                          controller.searchTextController.clear();
                          controller.searchText = null;
                          controller.searchPressed(false);
                        }))
              ]),
          body: InkWell(
            onTap: ()=> FocusScope.of(context).unfocus(),
            child: controller.obx(
                (state) => SmartRefresher(
                      enablePullDown: true,
                      enablePullUp: true,
                      onRefresh: () {
                        controller.searchTextController.clear();
                        controller.searchPressed(false);
                        controller.searchText = null;
                        controller.getAllMovies();
                      },
                      onLoading: () => controller.getAllMovies(isLoadMore: true),
                      header: const WaterDropHeader(),
                      controller: controller.refreshController,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return MovieCard(
                                      heroTag: controller.allMovies[index].imdbID,
                                      title: controller.allMovies[index].title,
                                      imageUrl:
                                          controller.allMovies[index].poster,
                                      releasedYear: controller.allMovies[index].year,
                                      onTap: () {
                                        Get.to(() => const MovieDetailsScreen(),
                                            arguments: controller
                                                .allMovies[index].imdbID,
                                            binding: BindingsBuilder(() {
                                          Get.lazyPut(() =>
                                              MovieDetailsViewController(sl()));
                                        }));
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(
                                      height: 10,
                                    );
                                  },
                                  itemCount: controller.allMovies.length),
                            ],
                          ),
                        ),
                      ),
                    ),
                onLoading: const LoadingMoviesWidget(),
                onError: (e) => Center(
                      child: Text(e.toString()),
                    )),
          ),
        ),
      ),
    );
  }

  Widget _searchTextField() {
    return TextFormField(
      autofocus: true,
      controller: controller.searchTextController,
      cursorColor: Colors.black,
      onFieldSubmitted: (value){
        controller.searchText = value;
        controller.getAllMovies();
      },
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      //Specify the action button on the keyboard
      decoration: const InputDecoration(
        //Style of TextField
        enabledBorder: UnderlineInputBorder(
            //Default TextField border
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: UnderlineInputBorder(
            //Borders when a TextField is in focus
            borderSide: BorderSide(color: Colors.white)),
        hintText: 'Search', //Text that is displayed when nothing is entered.
        hintStyle: TextStyle(
          //Style of hintText
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }
}
