import 'package:http/http.dart' as api;
import 'package:flutter_movie/ui/playing/now_playing_reponse.dart';
import 'dart:async';
import 'package:flutter_movie/ui/movie_model.dart';
import 'package:flutter_movie/api/request.dart';

Future<NowPlayingResponse> getNowPlayingMovie() async {
  final response = await api.get(nowPlaying());
  print(response.request.url);
  return nowPlayingResponseFromJson(response.body);
}

Future<Movie> getMovieDetail(int id) async {
  final response = await api.get(movieDetail(id));
  print(response.request.url);
  return movieItemListFromJson(response.body);
}