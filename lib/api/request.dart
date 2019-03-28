import 'package:flutter_movie/api/constants.dart';

Map<String, String> getApiKey() => {'api_key': API_KEY};

Uri nowPlaying() {
  var param = getApiKey();
  param['region'] = 'ID';
  return Uri.https(BASE_URL, NOW_PLAYING, param);
}

Uri popularMovie() =>
    Uri.https(BASE_URL, POPULAR, getApiKey());

Uri movieDetail(int id) =>
    Uri.https(BASE_URL, MOVIE_DETAIL + id.toString(), getApiKey());

Uri movieReview(int id) =>
    Uri.https(BASE_URL, MOVIE_DETAIL + id.toString() + "/reviews", getApiKey());

Uri movieCredits(int id) =>
    Uri.https(BASE_URL, MOVIE_DETAIL + id.toString() + "/credits", getApiKey());
