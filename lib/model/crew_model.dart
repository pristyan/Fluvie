import 'dart:convert';

CrewResponse crewResponseFromJson(String str) {
  final jsonData = json.decode(str);
  return CrewResponse.fromJson(jsonData);
}

class CrewResponse {
  List<CrewModel> crew;

  CrewResponse({this.crew});

  factory CrewResponse.fromJson(Map<String, dynamic> json) {
    var list = json["crew"] as List;
    List<CrewModel> parsedList =
        list.map((i) => CrewModel.fromJson(i)).toList();

    return CrewResponse(crew: parsedList);
  }
}

CrewModel crewFromJson(String str) {
  final jsonData = json.decode(str);
  return CrewModel.fromJson(jsonData);
}

class CrewModel {
  String department;
  String creditId;
  int gender;
  int id;
  String name;
  String job;
  String profilePath;

  CrewModel(
      {this.department,
      this.creditId,
      this.gender,
      this.id,
      this.name,
      this.job,
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

  factory CrewModel.fromJson(Map<String, dynamic> json) => CrewModel(
      department: json["department"],
      creditId: json["credit_id"],
      gender: json["gender"],
      id: json["id"],
      name: json["name"],
      job: json["job"],
      profilePath: json["profile_path"]);
}
