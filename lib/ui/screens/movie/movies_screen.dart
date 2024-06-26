import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/data/models/movies_model.dart';
import 'package:movie_catalog/data/services/network_calling.dart';
import 'package:movie_catalog/data/utils/urls.dart';
import 'package:movie_catalog/ui/screens/movie/movies_catalog_view.dart';
import '../../../data/models/network_response.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  MoviesModel _moviesList = MoviesModel();
  bool _isInProgress = false;

  Future<void> moviesList() async {
    _isInProgress = true;
    if(mounted){
      setState(() {});
    }
    NetworkResponse response =
    await NetworkCalling().getRequest(Urls.movies);
    if (response.isSuccess) {
      _moviesList = MoviesModel.fromJson(response.body!);
    } else {
      Get.snackbar('Movies Catalog', "Failed To Load");
    }
    _isInProgress = false;
    if(mounted){
      setState(() {});
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    moviesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Visibility(
              visible:!_isInProgress,
              replacement: const Center(
                  child:
                      CircularProgressIndicator(color: Colors.deepOrangeAccent)),
              child: MoviesCatalogView(data: _moviesList.results))
    ));
  }
}
