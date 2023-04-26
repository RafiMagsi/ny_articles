import 'package:intl/intl.dart';

class DateUtil {
  static String formatDate(DateTime? date) {
    if (date == null) return "";
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    return dateFormat.format(date);
  }
}
