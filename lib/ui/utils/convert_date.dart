import 'package:intl/intl.dart';

String getFormatedDate(DateTime dateTime) {
  return DateFormat("EEEE, d, MMM").format(dateTime);
}

String getDay(DateTime dateTime) {
  return DateFormat("EEE").format(dateTime);
}

String formatTime(DateTime dateTime) {
  return DateFormat("Hm").format(dateTime);
}
