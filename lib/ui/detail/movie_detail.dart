import 'package:flutter/material.dart';
import 'package:flutter_movie/style/dimens.dart';
import 'package:flutter_movie/ui/movie_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_movie/api/services.dart' as Api;

class MovieDetail extends StatefulWidget {
  final Movie movie;

  MovieDetail({this.movie});

  @override
  State<StatefulWidget> createState() => MovieDetailState(movie);
}

class MovieDetailState extends State<MovieDetail> {
  Movie movie;

  MovieDetailState(this.movie);

  Widget loading() => Column(
        children: <Widget>[LinearProgressIndicator()],
      );

  Widget errorMessage(String message) => Center(
        child: Text(message),
      );

  Widget headerView(Movie movie) => Container(
        color: Colors.blueGrey[700],
        padding: EdgeInsets.all(marginDefault),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              movie.getPosterUrl(),
              width: 80,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: marginDefault),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      movie.getReleaseDate(),
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: fontSmall,
                          color: Colors.grey[400]),
                    ),
                    Text(
                      movie.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: fontMedium,
                          color: Colors.white),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: marginSmall),
                      child: Text(
                        movie.getRunTime(),
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: fontSmall,
                            color: Colors.grey[400]),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: marginSmall),
                      child: Text(
                        movie.getGenres(),
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: fontSmall,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: marginSmall),
                      child: SmoothStarRating(
                        starCount: 5,
                        color: Colors.yellow[500],
                        borderColor: Colors.yellow[500],
                        allowHalfRating: true,
                        size: 20,
                        rating: (movie.voteAverage / 2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget movieOverview(Movie movie) => Container(
        padding: EdgeInsets.all(marginDefault),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text(
              movie.overview,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: fontNormal,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );

  Widget dataView(Movie movie) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          headerView(movie),
          movieOverview(movie),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text(movie.title),
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Image.network(
                    movie.getBackDropUrl(),
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Container(
          child: FutureBuilder<Movie>(
            future: Api.getMovieDetail(movie.id),
            builder: (context, result) {
              if (result.hasError)
                return errorMessage(result.error.toString());
              else if (result.hasData)
                return dataView(result.data);
              else
                return loading();
            },
          ),
        ),
      ),
    );
  }
}
