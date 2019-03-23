import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/movie_model.dart';
import 'package:flutter_movie/style/dimens.dart';

class NowPlayingList extends StatelessWidget {
  final List<Movie> items;

  NowPlayingList(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, position) {
            return ItemMovie(items[position]);
          }),
    );
  }
}

class ItemMovie extends StatelessWidget {
  final Movie movie;

  ItemMovie(this.movie);

  Widget titleText() => Container(
        child: Text(
          movie.title,
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

  Widget overviewText() => Container(
        margin: EdgeInsets.only(top: marginSmall),
        child: Text(
          movie.overview,
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

  Widget ratingText() => ClipRRect(
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(marginDefault)),
        child: Container(
          color: Colors.yellow[800],
          padding: EdgeInsets.all(marginSmall),
          child: Text(
            movie.voteAverage.toString(),
            softWrap: true,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Colors.white,
                fontSize: fontXSmall,
                fontWeight: FontWeight.bold),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(marginXSmall),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(marginDefault),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(marginDefault),
                  bottomLeft: Radius.circular(marginDefault)),
              child: Stack(
                children: <Widget>[
                  Image.network(
                    movie.getPosterUrl(),
                    height: 100,
                  ),
                  ratingText()
                ],
              ),
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(marginDefault),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      titleText(),
                      overviewText(),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
