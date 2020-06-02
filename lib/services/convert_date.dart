import 'package:intl/intl.dart';

class Util {
  static String getFormatedDate(DateTime dateTime) {
    return DateFormat("EEEE, d, MMM").format(dateTime);
  }

  static String getDay(DateTime dateTime) {
    return DateFormat("EEEE").format(dateTime);
  }

  static String formatTime(DateTime dateTime) {
    return DateFormat("Hm").format(dateTime);
  }
}
