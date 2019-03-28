import 'package:flutter/material.dart';
import 'package:flutter_movie/style/dimens.dart';
import 'package:flutter_movie/model/movie_model.dart';
import 'package:flutter_movie/model/review_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_movie/widget/review_item_list.dart';
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

  Widget buildLoadingView() => Column(
        children: <Widget>[LinearProgressIndicator()],
      );

  Widget buildErrorMessage(String message) => Center(
        child: Text(message),
      );

  Widget buildHeaderView(Movie movie) => Container(
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

  Widget buildMovieOverview(String overview) => Container(
        padding: EdgeInsets.all(marginDefault),
        child: Text(
          overview,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: fontNormal,
            color: Colors.black,
          ),
        ),
      );

  Widget buildReviewLabel() => Container(
        margin: EdgeInsets.all(marginDefault),
        child: Text(
          "Review",
          style: TextStyle(
              color: Colors.black,
              fontSize: fontInput,
              fontWeight: FontWeight.w700),
        ),
      );

  Widget buildDetail(Movie movie, ReviewResponse review) =>
      CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(child: buildHeaderView(movie)),
        SliverToBoxAdapter(child: buildMovieOverview(movie.overview)),
        SliverToBoxAdapter(child: buildReviewLabel()),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return reviewItemList(context, review.results[index]);
        }, childCount: review.results.length))
      ]);

  Widget buildReview(int id) => FutureBuilder<ReviewResponse>(
        future: Api.getMovieReview(id),
        builder: (context, result) {
          Widget widgetToDisplay;

          if (result.hasError)
            widgetToDisplay = SliverToBoxAdapter(
              child: buildErrorMessage(result.error.toString()),
            );
          else if (result.hasData)
            widgetToDisplay = SliverList(
                delegate: SliverChildBuilderDelegate((context, position) {
              return reviewItemList(context, result.data.results[position]);
            }));
          else
            widgetToDisplay = SliverToBoxAdapter(child: buildLoadingView());

          return CustomScrollView(
            slivers: <Widget>[widgetToDisplay],
          );
        },
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
        body: SafeArea(
          top: false,
          bottom: false,
          child: FutureBuilder<Movie>(
            future: Api.getMovieDetail(movie.id),
            builder: (context, detail) {
              if (detail.hasError)
                return buildErrorMessage(detail.error.toString());
              else if (detail.hasData)
                return FutureBuilder<ReviewResponse>(
                  future: Api.getMovieReview(movie.id),
                  builder: (context, review) {
                    if (review.hasError)
                      return buildErrorMessage(detail.error.toString());
                    else if (review.hasData)
                      return buildDetail(detail.data, review.data);
                    else
                      return buildLoadingView();
                  },
                );
              else
                return buildLoadingView();
            },
          ),
        ),
      ),
    );
  }
}
