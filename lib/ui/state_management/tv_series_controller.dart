import 'package:get/get.dart';
import '../../data/models/network_response.dart';
import '../../data/models/tv_series_model.dart';
import '../../data/services/network_calling.dart';
import '../../data/utils/urls.dart';

class TvSeriesController extends GetxController{
  TvSeriesModel _tvSeriesList = TvSeriesModel();
  bool _isInProgress = false;
  bool get showInProgress=> _isInProgress;
  TvSeriesModel get getTvSeriesList=> _tvSeriesList;

  Future<void> showTvSeriesList() async {
    _isInProgress = true;
    update();
    NetworkResponse response =
    await NetworkCalling().getRequest(Urls.tvSeries);
    if (response.isSuccess) {
      _tvSeriesList = TvSeriesModel.fromJson(response.body!);
      update();
    } else {
      Get.snackbar('Movies Catalog', "Failed To Load");
    }
    _isInProgress = false;
    update();
  }
}