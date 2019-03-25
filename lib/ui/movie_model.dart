import 'dart:convert';
import 'package:flutter_movie/util/date_util.dart';

Movie movieItemListFromJson(String str) {
  final jsonData = json.decode(str);
  return Movie.fromJson(jsonData);
}

class Movie {
  int voteCount;
  int id;
  bool video;
  String title;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<Genre> genres;
  String backdropPath;
  double voteAverage;
  bool adult;
  String overview;
  String releaseDate;
  int runtime;

  final String imageBaseUrl = "https://image.tmdb.org/t/p/w500";

  String getPosterUrl() => imageBaseUrl + posterPath;

  String getBackDropUrl() {
    if (backdropPath == null) return "";
    else return imageBaseUrl + backdropPath;
  }

  String getGenres() {
    String genre = "";
    genres.forEach((g) => genre = formatGenre(genre, g.name));
    return genre;
  }

  String formatGenre(String current, String next) {
    if (current == "") current = next;
    else current = current + ", " + next;
    return current;
  }

  String getRunTime() => "$runtime minutes";

  String getReleaseDate() => formatReadableDate(releaseDate);

  Movie({
    this.voteCount,
    this.id,
    this.video,
    this.title,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genres,
    this.voteAverage,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
    this.runtime,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    var genre = json["genres"] as List;
    List<Genre> parsedGenre = List<Genre>();
    if (genre != null) {
      parsedGenre = genre.map((i) => Genre.fromJson(i)).toList();
    }

    var rate = json["vote_average"];
    double avg = rate.toDouble();

    return new Movie(
      voteCount: json["vote_count"],
      id: json["id"],
      video: json["video"],
      title: json["title"],
      posterPath: json["poster_path"],
      originalLanguage: json["original_language"],
      originalTitle: json["original_title"],
      genres: parsedGenre,
      voteAverage: avg,
      backdropPath: json["backdrop_path"],
      adult: json["adult"],
      overview: json["overview"],
      releaseDate: json["release_date"],
      runtime: json["runtime"],
    );
  }

  Map<String, dynamic> toJson() => {
        "vote_count": voteCount,
        "id": id,
        "video": video,
        "title": title,
        "poster_path": posterPath,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "genres": genres,
        "vote_average": voteAverage,
        "backdrop_path": backdropPath,
        "adult": adult,
        "overview": overview,
        "release_date": releaseDate,
      };
}

class Genre {
  int id;
  String name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => new Genre(
        id: json["id"],
        name: json["name"],
      );
}
