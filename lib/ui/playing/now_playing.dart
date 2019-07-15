import 'package:flutter/material.dart';
import 'package:flutter_movie/api/services.dart' as Api;
import 'package:flutter_movie/model/movie_model.dart';
import 'package:flutter_movie/list/movie_item_list.dart';

class NowPlayingWidget extends StatefulWidget {
  @override
  NowPlayingState createState() => NowPlayingState();
}

class NowPlayingState extends State<NowPlayingWidget> {
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
