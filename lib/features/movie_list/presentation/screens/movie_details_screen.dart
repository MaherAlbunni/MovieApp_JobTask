import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movie_app/features/movie_list/presentation/controllers/movie_details_viewcontroller.dart';

class MovieDetailsScreen extends GetView<MovieDetailsViewController> {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
          (state) => Stack(
                children: [
                  Container(
                      height: double.infinity, color: const Color(0xFF000B49)),
                  Positioned.fill(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.5,
                          imageUrl: controller.movieDetails!.poster,
                          fit: BoxFit.fill,
                        )),
                  ),
                  const Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.transparent, Color(0xFF000B49)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [0.3, 0.5]),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            shape: BoxShape.circle),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Get.height * 0.18,
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            controller.movieDetails!.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ), // Text
                          const SizedBox(height: 10),
                          Text(
                              '${controller.movieDetails!.year} '
                              '| ${controller.movieDetails!.type} '
                              '| ${controller.movieDetails!.runtime}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              '${controller.movieDetails!.language} | ${controller.movieDetails!.country}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Text('${controller.movieDetails!.boxOffice}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          RatingBar.builder(
                            initialRating: double.parse(
                                controller.movieDetails!.imdbRating),
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemSize: 20,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 2),
                            unratedColor: Colors.white,
                            itemBuilder: (BuildContext context, int index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.amber,
                              );
                            },
                            itemCount: 10,
                            onRatingUpdate: (double value) {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            controller.movieDetails!.plot,
                            maxLines: 8,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.white, height: 1.75),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          onLoading: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                Text("Loading....",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                    )),
              ],
            ),
          )),
    );
  }
}
