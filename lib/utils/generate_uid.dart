import 'package:intl/intl.dart';

abstract class GenerateUID {
  const GenerateUID._();

  static String generateVeryUniqueID() {
    var uuid = DateFormat('yyMMddhhmmsss').format(DateTime.now());
    return "SG$uuid";
  }
}
