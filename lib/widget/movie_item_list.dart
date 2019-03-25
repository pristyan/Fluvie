import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/movie_model.dart';
import 'package:flutter_movie/style/dimens.dart';
import 'package:flutter_movie/ui/detail/movie_detail.dart';

Widget titleText(String title) => Container(
      child: Text(
        title,
        maxLines: 2,
        softWrap: true,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontNormal,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

Widget overviewText(String overview) => Container(
      margin: EdgeInsets.only(top: marginSmall),
      child: Text(
        overview,
        maxLines: 3,
        softWrap: true,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: fontSmall,
        ),
      ),
    );

Widget ratingText(double rating) => ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(marginDefault)),
      child: Container(
        color: Colors.yellow[800],
        padding: EdgeInsets.all(marginSmall),
        child: Text(
          rating.toString(),
          softWrap: true,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.white,
              fontSize: fontXSmall,
              fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget thumbnail(String url, double rating) => ClipRRect(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(marginDefault),
          bottomLeft: Radius.circular(marginDefault)),
      child: Stack(
        children: <Widget>[
          Image.network(
            url,
            height: 100,
          ),
          ratingText(rating)
        ],
      ),
    );

Widget descriptionContainer(String title, String overview) => Expanded(
      child: Container(
          padding: EdgeInsets.all(marginDefault),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              titleText(title),
              overviewText(overview),
            ],
          )),
    );

Widget movieItemList(BuildContext context, Movie movie) => Container(
      margin: EdgeInsets.all(marginXSmall),
      child: GestureDetector(
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieDetail(
                            movie: movie,
                          )))
            },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(marginDefault),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              thumbnail(movie.getPosterUrl(), movie.voteAverage),
              descriptionContainer(movie.title, movie.overview),
            ],
          ),
        ),
      ),
    );


class MovieList extends StatelessWidget {
  final List<Movie> items;

  MovieList(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, position) {
            return movieItemList(context, items[position]);
          }),
    );
  }
}
