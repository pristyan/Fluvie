import 'package:flutter/material.dart';
import 'package:flutter_movie/api/services.dart' as Api;
import 'package:flutter_movie/model/movie_model.dart';
import 'package:flutter_movie/widget/movie_item_list.dart';

class NowPlayingWidget extends StatefulWidget {
  @override
  NowPlayingState createState() => NowPlayingState();
}

class NowPlayingState extends State<NowPlayingWidget> {
  Widget movieListView(List<Movie> movies) => MovieList(movies);

  Widget errorDialog(message) => Center(child: Text(message));

  Widget loading() => Center(child: CircularProgressIndicator());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing"),
      ),
      body: FutureBuilder<MovieListResponse>(
        future: Api.getNowPlayingMovie(),
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
