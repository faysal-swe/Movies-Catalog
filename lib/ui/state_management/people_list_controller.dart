import 'dart:developer';

import 'package:get/get.dart';
import '../../data/models/network_response.dart';
import '../../data/models/people_model.dart';
import '../../data/services/network_calling.dart';
import '../../data/utils/urls.dart';

class PeopleListController extends GetxController{
  PeopleModel _peopleList = PeopleModel();
  bool _isInProgress = false;

  PeopleModel get getPeopleList => _peopleList;
  bool get getIsInProgress => _isInProgress;

  Future<void> showPeopleList() async {
    _isInProgress = true;
    update();
    NetworkResponse response =
    await NetworkCalling().getRequest(Urls.peopleList);
    if (response.isSuccess) {
      _peopleList = PeopleModel.fromJson(response.body!);
    } else {
      Get.snackbar('Movies Catalog','Failed to load');
    }
    log(response.isSuccess.toString());
    log('photo: ${_peopleList.results?[0].profilePath}');
    _isInProgress = false;
    update();
  }
}