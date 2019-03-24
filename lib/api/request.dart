import 'package:flutter_movie/api/constants.dart';

Uri nowPlaying() {
  var queryParam = {
    'api_key': API_KEY,
    'region': 'ID',
  };

  return Uri.https(BASE_URL, NOW_PLAYING, queryParam);
}

Uri movieDetail(int id) {
  var queryParam = {
    'api_key': API_KEY,
  };

  return Uri.https(BASE_URL, MOVIE_DETAIL + id.toString(), queryParam);
}
