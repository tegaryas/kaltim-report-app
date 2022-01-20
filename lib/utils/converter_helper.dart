import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class ConverterHelper {
  ConverterHelper._();

  static convertDateTimeToDateFormat(DateTime date, BuildContext context) {
    return DateFormat.MMMMEEEEd(Localizations.localeOf(context).toString())
        .format(date);
  }
}
