import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/ui/screens/home.dart';
import 'ui/state_management/movies_controller.dart';
import 'ui/state_management/people_list_controller.dart';
import 'ui/state_management/tv_series_controller.dart';

class MovieCatalogApp extends StatelessWidget {
  const MovieCatalogApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Movie Catalog',
        debugShowCheckedModeBanner:false,
        initialBinding: ControllerBinding(),
        theme:ThemeData.light(),
        darkTheme:ThemeData.dark(),
        themeMode:ThemeMode.dark,
        home: const HomeScreen());
  }
}

class ControllerBinding extends Bindings{
 @override
  void dependencies() {
    // TODO: implement dependencies
   Get.put<MoviesController>(MoviesController());
   Get.put<TvSeriesController>(TvSeriesController());
   Get.put<PeopleListController>(PeopleListController());
  }
}
