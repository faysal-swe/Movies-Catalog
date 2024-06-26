import 'package:flutter/material.dart';
import 'package:movie_catalog/data/models/network_response.dart';
import 'package:movie_catalog/data/models/tv_series_model.dart';
import 'package:movie_catalog/data/services/network_calling.dart';
import 'package:movie_catalog/data/utils/urls.dart';
import 'package:movie_catalog/ui/screens/movie/movie_details_screen.dart';
import 'package:movie_catalog/ui/screens/tv/tv_series_catalog_view.dart';

class TvSeriesScreen extends StatefulWidget {
  const TvSeriesScreen({Key? key}) : super(key: key);

  @override
  State<TvSeriesScreen> createState() => _TvSeriesScreenState();
}

class _TvSeriesScreenState extends State<TvSeriesScreen> {
  TvSeriesModel _tvSeriesList = TvSeriesModel();
  bool isInProgress = false;

  Future<void> showTvSeriesList() async {
    isInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
        await NetworkCalling().getRequest(Urls.tvSeries);
    if (response.isSuccess) {
      _tvSeriesList = TvSeriesModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Failed To Load')));
      }
    }
    isInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    showTvSeriesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: Visibility(
          visible: !isInProgress,
          replacement: const Center(
              child:
                  CircularProgressIndicator(color: Colors.deepOrangeAccent)),
          child: TvSeriesCatalogView(data: _tvSeriesList.results)),
    ));
  }
}
