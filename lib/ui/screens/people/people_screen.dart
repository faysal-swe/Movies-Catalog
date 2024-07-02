import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../state_management/people_list_controller.dart';
import 'people_list.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  final PeopleListController _peopleListController = Get.find<PeopleListController>();

  @override
  void initState() {
    // TODO: implement initState
    _peopleListController.showPeopleList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PeopleListController>(
      builder: (_) {
        return Visibility(
              visible: !_peopleListController.getIsInProgress,
              replacement: const Center(child:CircularProgressIndicator(color:Colors.deepOrangeAccent)),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Scaffold(
                  body: PeopleList(data:_peopleListController.getPeopleList.results),
                ),
              ),
            );
      }
    );
  }
}
