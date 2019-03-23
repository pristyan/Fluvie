import 'dart:convert';

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
  List<int> genreIds;
  String backdropPath;
  double voteAverage;
  bool adult;
  String overview;
  String releaseDate;

  final String imageBaseUrl = "https://image.tmdb.org/t/p/w500";

  String getPosterUrl() => imageBaseUrl + posterPath;

  Movie({
    this.voteCount,
    this.id,
    this.video,
    this.title,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.voteAverage,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    var genre = json["genre_ids"];
    List<int> parsedGenre = genre.cast<int>();

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
      genreIds: parsedGenre,
      voteAverage: avg,
      backdropPath: json["backdrop_path"],
      adult: json["adult"],
      overview: json["overview"],
      releaseDate: json["release_date"],
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
        "genre_ids": genreIds,
        "vote_average": voteAverage,
        "backdrop_path": backdropPath,
        "adult": adult,
        "overview": overview,
        "release_date": releaseDate,
      };
}
