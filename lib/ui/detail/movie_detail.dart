import 'package:flutter/material.dart';
import 'package:flutter_movie/style/dimens.dart';
import 'package:flutter_movie/model/movie_model.dart';
import 'package:flutter_movie/model/review_model.dart';
import 'package:flutter_movie/model/cast_model.dart';
import 'package:flutter_movie/model/crew_model.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_movie/list/review_item_list.dart';
import 'package:flutter_movie/list/cast_item_list.dart';
import 'package:flutter_movie/list/crew_item_list.dart';
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Review",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: fontInput,
                  fontWeight: FontWeight.w700),
            ),
            GestureDetector(
              child: Text(
                "More",
                style: TextStyle(
                    color: Colors.yellow[700],
                    fontSize: fontInput,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );

  Widget callDetailApi() => FutureBuilder<Movie>(
        future: Api.getMovieDetail(movie.id),
        builder: (context, detail) {
          if (detail.hasError)
            return Center(child: Text(detail.error.toString()));
          else if (detail.hasData)
            return buildOverviewTab(detail.data);
          else
            return Column(children: <Widget>[LinearProgressIndicator()]);
        },
      );

  Widget callReviewApi() => FutureBuilder<ReviewResponse>(
        future: Api.getMovieReview(movie.id),
        builder: (context, review) {
          if (review.hasError)
            return Center(child: Text(review.error.toString()));
          else if (review.hasData)
            return buildReviewTab(review.data);
          else
            return Column(children: <Widget>[LinearProgressIndicator()]);
        },
      );

  Widget callCastApi() => FutureBuilder<CastResponse>(
        future: Api.getCaster(movie.id),
        builder: (context, cast) {
          if (cast.hasError)
            return Center(child: Text(cast.error.toString()));
          else if (cast.hasData)
            return buildCastTab(cast.data);
          else
            return Column(children: <Widget>[LinearProgressIndicator()]);
        },
      );

  Widget callCrewApi() => FutureBuilder<CrewResponse>(
        future: Api.getCrew(movie.id),
        builder: (context, result) {
          if (result.hasError)
            return Center(child: Text(result.error.toString()));
          else if (result.hasData)
            return buildCrewTab(result.data);
          else
            return Column(children: <Widget>[LinearProgressIndicator()]);
        },
      );

  Widget buildOverviewTab(Movie movie) => CustomScrollView(slivers: <Widget>[
        SliverToBoxAdapter(child: buildHeaderView(movie)),
        SliverToBoxAdapter(child: buildMovieOverview(movie.overview)),
      ]);

  Widget buildReviewTab(ReviewResponse review) =>
      CustomScrollView(slivers: <Widget>[
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return reviewItemList(context, review.results[index]);
        }, childCount: review.results.length))
      ]);

  Widget buildCastTab(CastResponse cast) => CustomScrollView(slivers: <Widget>[
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return castItemList(context, cast.cast[index]);
        }, childCount: cast.cast.length))
      ]);

  Widget buildCrewTab(CrewResponse cast) => CustomScrollView(slivers: <Widget>[
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return crewItemList(context, cast.crew[index]);
        }, childCount: cast.crew.length))
      ]);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
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
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        text: "INFO",
                      ),
                      Tab(
                        text: "REVIEW",
                      ),
                      Tab(
                        text: "CAST",
                      ),
                      Tab(
                        text: "CREW",
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(children: [
              SafeArea(
                top: false,
                bottom: false,
                child: callDetailApi(),
              ),
              SafeArea(
                top: false,
                bottom: false,
                child: callReviewApi(),
              ),
              SafeArea(
                top: false,
                bottom: false,
                child: callCastApi(),
              ),
              SafeArea(
                top: false,
                bottom: false,
                child: callCrewApi(),
              ),
            ]),
          ),
        ));
  }
}
