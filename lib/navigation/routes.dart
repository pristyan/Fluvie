import 'package:flutter/material.dart';
import 'package:flutter_movie/ui/detail/movie_detail.dart';

Map<String, WidgetBuilder> getRoutes() => <String, WidgetBuilder>{
      '/movieDetail': (BuildContext context) => MovieDetail(),
    };
