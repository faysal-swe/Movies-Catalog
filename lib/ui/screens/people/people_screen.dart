import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_catalog/data/models/network_response.dart';
import 'package:movie_catalog/data/models/people_model.dart';
import 'package:movie_catalog/data/services/network_calling.dart';
import 'package:movie_catalog/data/utils/urls.dart';

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
          body: GridView.builder(
              itemCount: _peopleList.results?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 10.0,
                mainAxisExtent: 320.0,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => ShowMovieDetailsScreen(
                    //             id: widget.data![index].id.toString())));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom:15.0),
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        height:300,
                        child: Column(
                          children: [
                            Image.network(
                                Urls.baseImageUrl('${_peopleList.results?[index].profilePath}'),
                                height: 200,
                                width: double.infinity,
                                fit:BoxFit.fitWidth
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_peopleList.results?[index].name}',
                                    style:Theme.of(context).textTheme.titleMedium!.merge(
                                      const TextStyle(
                                        color:Colors.black87,
                                        fontWeight:FontWeight.w600
                                      )
                                  )
                                  ),
                                  Text(
                                      '${_peopleList.results?[index].knownFor?[0].originalTitle}',
                                      style:Theme.of(context).textTheme.titleSmall!.merge(
                                          const TextStyle(
                                              color:Colors.black45,
                                              fontWeight:FontWeight.w600
                                          )
                                      )
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
