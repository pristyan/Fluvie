import 'package:intl/intl.dart';

String getCurrentDate() {
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd');
  return formatter.format(now);
}

String formatReadableDate(String dateInput) {
  var formatter = new DateFormat('yyyy-MM-dd');
  var date = formatter.parse(dateInput);
  var finalFormatter = new DateFormat('dd MMM yyyy');
  return finalFormatter.format(date);
}