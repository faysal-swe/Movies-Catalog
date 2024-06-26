import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_catalog/ui/screens/tv/tv_series_catalog_view.dart';
import '../../state_management/tv_series_controller.dart';

class TvSeriesScreen extends StatefulWidget {
  const TvSeriesScreen({Key? key}) : super(key: key);

  @override
  State<TvSeriesScreen> createState() => _TvSeriesScreenState();
}

class _TvSeriesScreenState extends State<TvSeriesScreen> {
  final TvSeriesController _tvSeriesController = Get.find<TvSeriesController>();

  @override
  void initState() {
    // TODO: implement initState
    _tvSeriesController.showTvSeriesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(24.0),
      child: GetBuilder<TvSeriesController>(
        builder: (_) {
          return Visibility(
              visible: !_tvSeriesController.showInProgress,
              replacement: const Center(
                  child:
                      CircularProgressIndicator(color: Colors.deepOrangeAccent)),
              child: TvSeriesCatalogView(data: _tvSeriesController.getTvSeriesList.results));
        }
      ),
    ));
  }
}
