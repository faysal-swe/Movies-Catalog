import 'package:get/get.dart';
import 'package:movie_catalog/data/models/movies_model.dart';
import 'package:movie_catalog/data/models/network_response.dart';
import 'package:movie_catalog/data/services/network_calling.dart';
import 'package:movie_catalog/data/utils/urls.dart';

class MoviesController extends GetxController{
  MoviesModel _moviesList = MoviesModel();
  bool _isInProgress = false;
  bool get movieInProgress=> _isInProgress;
  MoviesModel get showMovieList=> _moviesList;

  Future<void> moviesList() async {
    _isInProgress = true;
    update();
    NetworkResponse response =
    await NetworkCalling().getRequest(Urls.movies);
    if (response.isSuccess) {
      _moviesList = MoviesModel.fromJson(response.body!);
      update();
    } else {
      Get.snackbar('Movies Catalog', "Failed To Load");
    }
    _isInProgress = false;
    update();
  }

}