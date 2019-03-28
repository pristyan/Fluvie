import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movie_model.dart';
import 'package:flutter_movie/list/movie_item_list.dart';
import 'package:flutter_movie/api/services.dart' as Api;

class Popular extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PopularState();

}

class PopularState extends State<Popular> {

  Widget movieListView(List<Movie> movies) => MovieList(movies);

  Widget errorDialog(message) => Center(child: Text(message));

  Widget loading() => Center(child: CircularProgressIndicator());

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
            return errorDialog(result.error.toString());
          else if (result.hasData)
            return movieListView(result.data.results);
          else
            return loading();
        },
      ),
    );
  }

}