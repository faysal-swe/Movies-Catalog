import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:movie_catalog/data/models/network_response.dart';
import 'package:movie_catalog/data/models/tv_series_details_model.dart';
import 'package:movie_catalog/data/services/network_calling.dart';
import 'package:movie_catalog/data/utils/urls.dart';

class TvSeriesDetailsScreen extends StatefulWidget {
  final String id;
  const TvSeriesDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<TvSeriesDetailsScreen> createState() => _TvSeriesDetailsScreenState();
}

class _TvSeriesDetailsScreenState extends State<TvSeriesDetailsScreen> {
  TvSeriesDetailsModel _tvSeriesDetails = TvSeriesDetailsModel();
  bool isInProgress = false;

  Future<void> showMovieDetails() async {
    isInProgress = true;
    if (mounted) {
      setState(() {});
    }
    NetworkResponse response =
    await NetworkCalling().getRequest(Urls.tvSeriesDetails(widget.id));
    if (response.isSuccess) {
      _tvSeriesDetails = TvSeriesDetailsModel.fromJson(response.body!);
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
    showMovieDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Visibility(
          visible: !isInProgress,
          replacement: const Center(
              child: CircularProgressIndicator(color: Colors.deepOrangeAccent)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Image.network(
                      Urls.baseImageUrl(_tvSeriesDetails.posterPath.toString()),
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                        top: 20,
                        left: 20,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_rounded,
                                color: Colors.white, size: 30.0, weight: 10.0)))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_tvSeriesDetails.name.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .merge(const TextStyle(fontWeight: FontWeight.w700))),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.access_time, color: Colors.white60),
                              const SizedBox(width: 10.0),
                              Text(_tvSeriesDetails.episodeRunTime.runtimeType.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .merge(const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white60)))
                            ],
                          ),
                          const SizedBox(width: 30.0),
                          Row(
                            children: [
                              const Icon(Icons.star),
                              const SizedBox(width: 10.0),
                              Text(
                                  "${_tvSeriesDetails.voteAverage?.toStringAsFixed(1)}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .merge(const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white60)))
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const Divider(color: Colors.white10),
                      const SizedBox(height: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Release date',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .merge(const TextStyle(
                                  fontWeight: FontWeight.w700))),
                          const SizedBox(height: 10.0),
                          Text(_tvSeriesDetails.firstAirDate.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .merge(const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white60,
                              )))
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Genre',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .merge(const TextStyle(
                                  fontWeight: FontWeight.w700))),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 40.0,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              primary: false,
                              shrinkWrap: true,
                              itemCount: _tvSeriesDetails.genres?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Chip(
                                    label: Text(
                                      "${_tvSeriesDetails.genres?[index].name}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .merge(const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white60,
                                      )),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      const Divider(color: Colors.white10),
                      const SizedBox(height: 10.0),
                      Text(
                        'Overview',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .merge(const TextStyle(fontWeight: FontWeight.w700)),
                      ),
                      const SizedBox(height: 10.0),
                      Text(_tvSeriesDetails.overview.toString(),
                          textAlign: TextAlign.justify,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .merge(const TextStyle(
                            color: Colors.white60,
                          ))),
                      const SizedBox(height: 30.0),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
