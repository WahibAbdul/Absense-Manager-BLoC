import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static DateTime? getDateFromString(String date, String pattern) {
    DateFormat format = DateFormat(pattern);
    try {
      return format.parse(date);
    } catch (e) {
      return null;
    }
  }

  static String getFormattedDate(DateTime date, String pattern) {
    DateFormat format = DateFormat(pattern);
    final value = format.format(date);
    return value;
  }

  static String getLocaleFormattedDate(DateTime date, BuildContext context) {
    String? locale = Localizations.localeOf(context).countryCode;
    DateFormat format = DateFormat(locale);
    return format.format(date);
  }

  static String getFormattedTime(TimeOfDay time, String outputPattern) {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final format = DateFormat(outputPattern);
    return format.format(date);
  }
}
