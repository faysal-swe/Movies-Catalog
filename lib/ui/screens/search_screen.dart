import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:movie_catalog/data/models/network_response.dart';
import 'package:movie_catalog/data/models/search_model.dart';
import 'package:movie_catalog/data/services/network_calling.dart';
import 'package:movie_catalog/data/utils/urls.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchModel _search = SearchModel();
  bool isInProgress = false;
  bool isVisible = true;

  Future<void> searchKeyword(String searchKeyword) async {
    isVisible = false;
    isInProgress = true;
    if (mounted) {
      setState(() {});
    }
    log('search keyword: $searchKeyword');
    log('URls: ${Urls.search(searchKeyword)}');
    NetworkResponse response =
        await NetworkCalling().getRequest(Urls.search(searchKeyword));
    if (response.isSuccess) {
      _search = SearchModel.fromJson(response.body!);
      log('reponse: ${response.isSuccess}');
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Failed To Load')));
      }
    }
    log('isInprogress: $isInProgress');
    isInProgress = false;
    log('isInprogress: $isInProgress');
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                searchKeyword(value);
              }else{
                isVisible = true;
                if(mounted){
                  setState(() {});
                }
              }

            },
            decoration: const InputDecoration(
              hintText: 'Search...',
              hintStyle: TextStyle(fontSize: 20.0),
              prefixIcon: Icon(Icons.search),
            ),
            textInputAction: TextInputAction.search,
          ),
          const SizedBox(height: 20),
          Expanded(
              child: Visibility(
            visible: !isVisible,
            replacement: Center(
                child: Text('Search your favourite moves',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .merge(const TextStyle(color: Colors.white60)))),
            child: Visibility(
              visible: !isInProgress,
              replacement: const Center(child:CircularProgressIndicator(color:Colors.deepOrangeAccent)),
              child: Padding(
                padding: const EdgeInsets.all(17.0),
                child: ListView.separated(
                    itemCount: _search.results?.length.toInt() ?? 0,
                    itemBuilder: (context, index) {
                      return Wrap(
                        children: [
                          Image.network(Urls.baseImageUrl("${_search.results?[index].posterPath}"),
                              height: 100.0, width: 100.0, fit: BoxFit.cover),
                          const SizedBox(width: 20),
                          Text(
                              "${(_search.results?[index].title)??(_search.results?[index].name)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .merge(const TextStyle(
                                      fontWeight: FontWeight.w600))),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Column(
                        children: [
                          SizedBox(height: 10), // Space before Divider
                          Divider(color: Colors.white10),
                          SizedBox(height: 10), // Space after Divider
                        ],
                      );
                    }),
              )
              ,
            ),
          ))
        ],
      ),
    ));
  }
}
