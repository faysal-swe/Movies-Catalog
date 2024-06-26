import 'package:flutter/material.dart';
import 'package:movie_catalog/data/models/tv_series_model.dart';
import 'package:movie_catalog/data/utils/urls.dart';
import 'package:movie_catalog/ui/screens/tv/tv_series_details_screen.dart';

class TvSeriesCatalogView extends StatefulWidget {
  final List<Results>? data;

  const TvSeriesCatalogView({Key? key,required this.data}) : super(key: key);
  @override
  State<TvSeriesCatalogView> createState() => _TvSeriesCatalogViewState();
}

class _TvSeriesCatalogViewState extends State<TvSeriesCatalogView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount:widget.data?.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2,
            crossAxisSpacing:16.0,
            mainAxisSpacing:10.0,
            mainAxisExtent:300,
          ),
          itemBuilder:(context, index){
            return InkWell(
              onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> TvSeriesDetailsScreen(id:widget.data![index].id.toString()))
                );
              },
              child: Column(
                children: [
                  Container(
                      decoration:BoxDecoration(
                          borderRadius:BorderRadius.circular(16.0),
                          color:Colors.deepOrangeAccent
                      ),
                      child:ClipRRect(
                          borderRadius:const BorderRadius.only(
                            topLeft:Radius.circular(12.0),
                            topRight:Radius.circular(12.0),
                          ),
                          child:Image.network(
                              Urls.baseImageUrl(widget.data![index].posterPath.toString()),
                              height:250,
                              width:double.infinity,
                              fit:BoxFit.cover
                          )
                      )
                  ),
                  const SizedBox(height:8.0),
                  Text(
                      widget.data![index].name.toString(),
                    style:Theme.of(context).textTheme.titleSmall
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}
