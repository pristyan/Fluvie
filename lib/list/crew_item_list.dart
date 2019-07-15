import 'package:flutter/material.dart';
import 'package:flutter_movie/model/crew_model.dart';
import 'package:flutter_movie/style/dimens.dart';

Widget crewItemList(BuildContext context, CrewModel cast) => Container(
      margin: EdgeInsets.symmetric(horizontal: marginXSmall),
      child: GestureDetector(
          child: Container(
        padding: EdgeInsets.only(
            left: marginDefault, right: marginDefault, top: marginDefault),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(cast.getProfileImage()))),
            ),
            Container(
              margin: EdgeInsets.only(left: marginDefault),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    cast.name,
                    style: TextStyle(
                        fontSize: fontNormal,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: marginXSmall),
                    child: Text(
                      cast.department,
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
            )
          ],
        ),
      )),
    );
