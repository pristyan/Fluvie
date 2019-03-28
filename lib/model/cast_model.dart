import 'dart:convert';

CastResponse castResponseFromJson(String str) {
  final jsonData = json.decode(str);
  return CastResponse.fromJson(jsonData);
}

class CastResponse {
  List<CastModel> cast;

  CastResponse({this.cast});

  factory CastResponse.fromJson(Map<String, dynamic> json) {
    var list = json["cast"] as List;
    List<CastModel> parsedList =
        list.map((i) => CastModel.fromJson(i)).toList();

    return CastResponse(cast: parsedList);
  }
}

CastModel castFromJson(String str) {
  final jsonData = json.decode(str);
  return CastModel.fromJson(jsonData);
}

class CastModel {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  String profilePath;

  CastModel(
      {this.castId,
      this.character,
      this.creditId,
      this.gender,
      this.id,
      this.name,
      this.profilePath});

  final String imageBaseUrl = "https://image.tmdb.org/t/p/w185";
  final String defaultProfile =
      "http://www.classicindiascale.com/wp-content/uploads/2018/06/header-profile-default.png";

  String getProfileImage() {
    if (profilePath == null)
      return defaultProfile;
    else
      return imageBaseUrl + profilePath;
  }

  factory CastModel.fromJson(Map<String, dynamic> json) => CastModel(
      castId: json["cast_id"],
      character: json["character"],
      creditId: json["credit_id"],
      gender: json["gender"],
      id: json["id"],
      name: json["name"],
      profilePath: json["profile_path"]);
}
