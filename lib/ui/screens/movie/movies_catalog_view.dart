import 'package:flutter/material.dart';
import 'package:movie_catalog/data/models/movies_model.dart';
import 'package:movie_catalog/data/utils/urls.dart';
import 'package:movie_catalog/ui/screens/movie/movie_details_screen.dart';

class MoviesCatalogView extends StatefulWidget {
  final List<Results>? data;

  const MoviesCatalogView({Key? key, required this.data}) : super(key: key);
  @override
  State<MoviesCatalogView> createState() => _MoviesCatalogViewState();
}

class _MoviesCatalogViewState extends State<MoviesCatalogView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: widget.data?.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 10.0,
            mainAxisExtent: 300,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowMovieDetailsScreen(
                            id: widget.data![index].id.toString())));
              },
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          color: Colors.deepOrangeAccent),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0),
                          ),
                          child: Image.network(
                              Urls.baseImageUrl(widget.data![index].posterPath.toString()),
                              height: 250,
                              width: double.infinity,
                              fit: BoxFit.cover))),
                  const SizedBox(height: 8.0),
                  Text('${widget.data?[index].title}',
                      style: Theme.of(context).textTheme.titleSmall)
                ],
              ),
            );
          }),
    );
  }
}
