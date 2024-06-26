import 'package:flutter/material.dart';
import '../../../data/models/people_model.dart';
import '../../../data/utils/urls.dart';

class PeopleList extends StatefulWidget {
  final List<Results>? data;
  const PeopleList({Key? key, this.data}) : super(key: key);

  @override
  State<PeopleList> createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: widget.data?.length,
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
                          Urls.baseImageUrl(widget.data![index].profilePath.toString()),
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
                                widget.data![index].name.toString(),
                                style:Theme.of(context).textTheme.titleMedium!.merge(
                                    const TextStyle(
                                        color:Colors.black87,
                                        fontWeight:FontWeight.w600
                                    )
                                )
                            ),
                            Text(
                                widget.data![index].knownFor![0].originalTitle.toString(),
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
        });
  }
}
