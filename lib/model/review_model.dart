import 'dart:convert';

ReviewResponse movieReviewResponseFromJson(String str) {
  final jsonData = json.decode(str);
  return ReviewResponse.fromJson(jsonData);
}

class ReviewResponse {
  int page;
  int totalPages;
  List<ReviewModel> results;

  ReviewResponse({this.page, this.totalPages, this.results});

  factory ReviewResponse.fromJson(Map<String, dynamic> json) {
    var list = json["results"] as List;
    List<ReviewModel> parsedList =
        list.map((i) => ReviewModel.fromJson(i)).toList();

    return ReviewResponse(
        page: json["page"],
        totalPages: json["total_pages"],
        results: parsedList);
  }
}

ReviewModel reviewFromJson(String str) {
  final jsonData = json.decode(str);
  return ReviewModel.fromJson(jsonData);
}

class ReviewModel {
  String author;
  String content;
  String id;

  ReviewModel({this.author, this.content, this.id});

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        author: json["author"],
        content: json["content"],
        id: json["id"],
      );
}
