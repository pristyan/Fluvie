import 'package:flutter_movie/ui/movie_model.dart';
import 'dart:convert';

NowPlayingResponse nowPlayingResponseFromJson(String str) {
  final jsonData = json.decode(str);
  return NowPlayingResponse.fromJson(jsonData);
}

class NowPlayingResponse {
  int page;
  int totalPages;
  List<Movie> results;

  NowPlayingResponse({this.page, this.totalPages, this.results});

  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) {
    var list = json["results"] as List;
    List<Movie> parsedList = list.map((i) => Movie.fromJson(i)).toList();

    return NowPlayingResponse(
        page: json["page"],
        totalPages: json["total_pages"],
        results: parsedList);
  }

  Map<String, dynamic> toJson() =>
      {"page": page, "total_pages": totalPages, "results": results};
}
