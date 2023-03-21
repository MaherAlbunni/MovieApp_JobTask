import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:movie_app/base/controller/appbase_controller.dart';
import 'package:movie_app/features/movie_list/presentation/controllers/movie_viewcontroller.dart';
import 'package:movie_app/features/movie_list/presentation/screens/movies_screen.dart';

import 'base/services/service_locator.dart';

void main() async{
  await dotenv.load(fileName: ".env");

  ServicesLocator().init();
  Get.put(AppBaseController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => MovieViewController(sl()));
      }),
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MoviesScreen(),
    );
  }
}
