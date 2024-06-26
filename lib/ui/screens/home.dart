import 'package:flutter/material.dart';
import 'package:movie_catalog/ui/screens/movie/movies_screen.dart';
import 'package:movie_catalog/ui/screens/people/people_screen.dart';
import 'package:movie_catalog/ui/screens/search_screen.dart';
import 'package:movie_catalog/ui/screens/tv/tv_series_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
              title: Text('Movies Catalog',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .merge(const TextStyle(
                        fontWeight: FontWeight.w700,
                      ))),
              centerTitle: true,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SearchScreen()));
                    },
                    icon: const Icon(Icons.search, color: Colors.white),
                    iconSize: 30)
              ],
              bottom: const TabBar(
                labelColor: Colors.deepOrangeAccent,
                indicatorColor: Colors.deepOrangeAccent,
                labelPadding: EdgeInsets.all(5),
                tabs: [
                  Tab(text: 'Movies'),
                  Tab(text: 'Tv Shows'),
                  Tab(text: 'People')
                ],
              )),
          body: const TabBarView(children: [
            MoviesScreen(),
            TvSeriesScreen(),
            PeopleScreen(),
          ])),
    );
  }
}
