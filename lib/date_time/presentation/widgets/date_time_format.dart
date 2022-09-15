import 'package:intl/intl.dart';

class DateTimeFormat {
  static String dateDMY({required String dateTime}) {
    DateTime dateTimeParsed = DateTime.parse(dateTime);

    return DateFormat('dd/MM/yyyy').format(dateTimeParsed);
  }

  static String dateYMD({required String dateTime}) {
    DateTime dateTimeParsed = DateTime.parse(dateTime);

    return DateFormat('yyyy/MM/dd').format(dateTimeParsed);
  }

  static String hyphenDateDMY({required String dateTime}) {
    DateTime dateTimeParsed = DateTime.parse(dateTime);

    return DateFormat('dd-MM-yyyy').format(dateTimeParsed);
  }

  static String hyphenDateYMD({required String dateTime}) {
    DateTime dateTimeParsed = DateTime.parse(dateTime);

    return DateFormat('yyyy-MM-dd').format(dateTimeParsed);
  }

  static String underscoreDateDMY({required String dateTime}) {
    DateTime dateTimeParsed = DateTime.parse(dateTime);

    return DateFormat('dd_MM_yyyy').format(dateTimeParsed);
  }

  static String underscoreDateYMD({required String dateTime}) {
    DateTime dateTimeParsed = DateTime.parse(dateTime);

    return DateFormat('yyyy_MM_dd').format(dateTimeParsed);
  }

  static String dateYM({required String dateTime}) {
    DateTime dateTimeParsed = DateTime.parse(dateTime);

    return DateFormat('yyyy/MM').format(dateTimeParsed);
  }

  static String hyphenDateYM({required String dateTime}) {
    DateTime dateTimeParsed = DateTime.parse(dateTime);

    return DateFormat('yyyy-MM').format(dateTimeParsed);
  }

  static String underscoreDateYM({required String dateTime}) {
    DateTime dateTimeParsed = DateTime.parse(dateTime);

    return DateFormat('yyyy_MM').format(dateTimeParsed);
  }

  static String hourHM({required String dateTime}) {
    DateTime dateTimeParsed = DateTime.parse(dateTime);

    return DateFormat('HH:mm:ss').format(dateTimeParsed);
  }

  static String underscoreHourHM({required String dateTime}) {
    DateTime dateTimeParsed = DateTime.parse(dateTime);

    return DateFormat('HH_mm_ss').format(dateTimeParsed);
  }
}
