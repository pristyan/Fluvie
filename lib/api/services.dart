import 'package:http/http.dart' as api;
import 'dart:async';
import 'package:flutter_movie/model/movie_model.dart';
import 'package:flutter_movie/model/review_model.dart';
import 'package:flutter_movie/model/cast_model.dart';
import 'package:flutter_movie/model/crew_model.dart';
import 'package:flutter_movie/api/request.dart';

Future<MovieListResponse> getNowPlayingMovie() async {
  final response = await api.get(nowPlaying());
  print(response.request.url);
  return movieListResponseFromJson(response.body);
}

Future<Movie> getMovieDetail(int id) async {
  final response = await api.get(movieDetail(id));
  print(response.request.url);
  return movieDetailFromJson(response.body);
}

Future<MovieListResponse> getPopularMovie() async {
  final response = await api.get(popularMovie());
  print(response.request.url);
  return movieListResponseFromJson(response.body);
}

Future<ReviewResponse> getMovieReview(int id) async {
  final response = await api.get(movieReview(id));
  print(response.request.url);
  return reviewResponseFromJson(response.body);
}

Future<CastResponse> getCaster(int id) async {
  final response = await api.get(movieCredits(id));
  print(response.request.url);
  return castResponseFromJson(response.body);
}

Future<CrewResponse> getCrew(int id) async {
  final response = await api.get(movieCredits(id));
  print(response.request.url);
  return crewResponseFromJson(response.body);
}