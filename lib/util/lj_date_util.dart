import 'package:date_format/date_format.dart';
class LJDateUtil {
  static String stringFromDate(DateTime date, String format) {
    return formatDate(date, [format]);
  }
  static DateTime? dateFromString(String time, String format) {
    try{
      DateTime? date = DateTime.tryParse(time);
      return date;
    // ignore: empty_catches
    } catch (e) {

    }
    return null;
  }
  static String? dateStringFromString(String time, String format) {
    DateTime? date;
    try{
      date = DateTime.tryParse(time);
      // ignore: empty_catches
    } catch (e) {
      return null;
    }
    return stringFromDate(date!, format);
  }
}