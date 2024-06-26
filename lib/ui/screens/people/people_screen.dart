import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:movie_catalog/data/models/network_response.dart';
import 'package:movie_catalog/data/models/people_model.dart';
import 'package:movie_catalog/data/services/network_calling.dart';
import 'package:movie_catalog/data/utils/urls.dart';
import 'people_list.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  PeopleModel _peopleList = PeopleModel();
  bool isInProgress = false;


  Future<void> showPeopleList() async {
    isInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
    await NetworkCalling().getRequest(Urls.peopleList);
    if (response.isSuccess) {
      _peopleList = PeopleModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Failed To Load')));
      }
    }
    log('photo: ${_peopleList.results?[0].profilePath}');
    isInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    showPeopleList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
          visible: !isInProgress,
          replacement: const Center(child:CircularProgressIndicator(color:Colors.deepOrangeAccent)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Scaffold(
              body: PeopleList(data:_peopleList.results),
            ),
          ),
        );
  }
}
