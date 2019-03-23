import 'package:http/http.dart' as api;
import 'package:flutter_movie/ui/playing/now_playing_reponse.dart';
import 'package:flutter_movie/api/endpoint.dart' as path;
import 'dart:async';

Future<NowPlayingResponse> getNowPlayingMovie() async {
  final response = await api.get(path.NOW_PLAYING);
  return nowPlayingResponseFromJson(response.body);
}