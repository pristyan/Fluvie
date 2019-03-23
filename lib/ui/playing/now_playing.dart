import 'package:flutter/material.dart';
import 'now_playing_reponse.dart';
import 'package:flutter_movie/api/services.dart' as Api;
import 'now_playing_list.dart';
import 'package:flutter_movie/ui/movie_model.dart';

class NowPlayingWidget extends StatefulWidget {
  @override
  NowPlayingState createState() => NowPlayingState();
}

class NowPlayingState extends State<NowPlayingWidget> {
  Widget movieListView(List<Movie> movies) => NowPlayingList(movies);

  Widget errorDialog(message) => Center(child: Text(message));

  Widget loading() => Center(child: CircularProgressIndicator());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing"),
      ),
      body: FutureBuilder<NowPlayingResponse>(
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
