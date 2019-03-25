import 'package:http/http.dart' as api;
import 'dart:async';
import 'package:flutter_movie/ui/movie_model.dart';
import 'package:flutter_movie/api/request.dart';

Future<MovieListResponse> getNowPlayingMovie() async {
  final response = await api.get(nowPlaying());
  print(response.request.url);
  return movieListResponseFromJson(response.body);
}

Future<Movie> getMovieDetail(int id) async {
  final response = await api.get(movieDetail(id));
  print(response.request.url);
  return movieItemListFromJson(response.body);
}

Future<MovieListResponse> getPopularMovie() async {
  final response = await api.get(popularMovie());
  print(response.request.url);
  return movieListResponseFromJson(response.body);
}