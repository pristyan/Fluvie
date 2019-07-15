import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movie_model.dart';
import 'package:flutter_movie/list/movie_item_list.dart';
import 'package:flutter_movie/api/services.dart' as Api;

class Popular extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PopularState();
}

class PopularState extends State<Popular> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular"),
      ),
      body: FutureBuilder<MovieListResponse>(
        future: Api.getPopularMovie(),
        builder: (context, result) {
          if (result.hasError)
            return Center(child: Text(result.error.toString()));
          else if (result.hasData)
            return MovieList(result.data.results);
          else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
