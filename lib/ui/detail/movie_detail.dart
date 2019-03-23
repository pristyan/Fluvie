import 'package:flutter/material.dart';
import 'package:flutter_movie/style/dimens.dart';
import 'package:flutter_movie/ui/movie_model.dart';

class MovieDetail extends StatefulWidget {
  final Movie movie;

  MovieDetail({this.movie});

  @override
  State<StatefulWidget> createState() => MovieDetailState(movie);
}

class MovieDetailState extends State<MovieDetail> {
  Movie movie;

  MovieDetailState(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: Container(
        padding: EdgeInsets.all(marginDefault),
        child: Center(
          child: Text("Body"),
        ),
      ),
    );
  }
}
