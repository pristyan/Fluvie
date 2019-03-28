import 'package:flutter/material.dart';
import 'package:flutter_movie/model/review_model.dart';
import 'package:flutter_movie/style/dimens.dart';

Widget reviewItemList(BuildContext context, ReviewModel review) => Container(
      margin: EdgeInsets.symmetric(horizontal: marginXSmall),
      child: GestureDetector(
          child: Container(
        padding: EdgeInsets.only(
            left: marginDefault, right: marginDefault, top: marginDefault),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              review.author,
              style: TextStyle(
                  fontSize: fontNormal,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            Container(
              margin: EdgeInsets.only(top: marginXSmall),
              child: Text(
                review.content,
                softWrap: true,
                style: TextStyle(
                    fontSize: fontSmall,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey[800]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: marginDefault),
              color: Colors.grey[400],
              height: 0.5,
            )
          ],
        ),
      )),
    );