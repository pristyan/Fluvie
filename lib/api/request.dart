import 'package:flutter_movie/api/constants.dart';
import 'package:flutter_movie/util/date_util.dart';

Uri nowPlaying() {
  var queryParam = {
    'api_key': API_KEY,
    'primary_release_date.lte': getCurrentDate(),
  };

  return Uri.https(BASE_URL, NOW_PLAYING, queryParam);
}

Uri movieDetail(int id) {
  var queryParam = {
    'api_key': API_KEY,
  };

  return Uri.https(BASE_URL, MOVIE_DETAIL + id.toString(), queryParam);
}
