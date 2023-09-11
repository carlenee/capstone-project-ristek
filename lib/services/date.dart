import 'package:intl/intl.dart';

class DateService {
  static parse(String date) => DateTime.tryParse(date) ?? "";

  static formatTimeDate(DateTime date) =>
      DateFormat("HH:mm dd MMMM").format(date);
}
