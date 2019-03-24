class MovieDetailModel {
  bool adult;
  String backdropPath;
  int budget;
  List<Genre> genres;
  int voteCount;
  int id;
  bool video;
  String title;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  double voteAverage;
  String overview;
  String releaseDate;
}

class Genre {
  int id;
  String name;

  Genre({this.id, this.name});
}
