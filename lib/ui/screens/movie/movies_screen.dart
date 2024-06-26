import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/ui/screens/movie/movies_catalog_view.dart';
import '../../state_management/movies_controller.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final MoviesController _moviesController = Get.find<MoviesController>();

  @override
  void initState() {
    // TODO: implement initState
    _moviesController.moviesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: GetBuilder<MoviesController>(
        builder: (_) {
          return Visibility(
                  visible:!_moviesController.showInProgress,
                  replacement: const Center(
                      child:
                          CircularProgressIndicator(color: Colors.deepOrangeAccent)),
                  child: MoviesCatalogView(data: _moviesController.showMovieList.results));
        }
      )
    ));
  }
}
