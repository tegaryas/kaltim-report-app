import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class ConverterHelper {
  ConverterHelper._();

  static convertDateTimeToDateFormat(DateTime date, BuildContext context) {
    return DateFormat.MMMMEEEEd(Localizations.localeOf(context).toString())
        .format(date);
  }

  static String differenceTimeParse(DateTime date) {
    final now = DateTime.now();

    String? difference;
    final seconds = now.difference(date).inSeconds;
    final days = now.difference(date).inDays;
    final hours = now.difference(date).inHours;
    final minutes = now.difference(date).inMinutes;

    if (seconds < 60) difference = seconds.toString() + " detik yang lalu";
    if (seconds > 60) difference = minutes.toString() + " menit yang lalu";
    if (minutes > 60) difference = hours.toString() + " jam yang lalu";
    if (hours > 24) difference = days.toString() + " hari yang lalu";

    return difference!;
  }

  static Color skalaRichterToColor(double magnetudo) {
    if (magnetudo <= 2.9) {
      return Colors.green;
    } else if (magnetudo >= 2.9 && magnetudo < 5.9) {
      return Colors.blue;
    } else if (magnetudo >= 5.9 && magnetudo < 7.9) {
      return Colors.orange;
    } else if (magnetudo >= 7.9) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }
}
