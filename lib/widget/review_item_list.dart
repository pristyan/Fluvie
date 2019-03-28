import 'package:flutter/material.dart';
import 'package:flutter_movie/model/review_model.dart';
import 'package:flutter_movie/style/dimens.dart';

Widget reviewItemList(BuildContext context, ReviewModel review) => Container(
      margin: EdgeInsets.symmetric(horizontal: marginXSmall),
      child: GestureDetector(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(marginDefault),
          ),
          child: Container(
            padding: EdgeInsets.all(marginDefault),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  review.author,
                  style: TextStyle(
                      fontSize: fontNormal,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),
                ),

                Text(
                  review.content,
                  maxLines: 3,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: fontSmall,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[800]
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );


class ReviewList extends StatelessWidget {
  final List<ReviewModel> items;

  ReviewList(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, position) {
            return /*reviewItemList(context, items[position])*/ Text("Aw");
          }),
    );
  }
}
