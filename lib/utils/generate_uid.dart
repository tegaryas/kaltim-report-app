import 'package:intl/intl.dart';

abstract class GenerateUID {
  const GenerateUID._();

  static String generateVeryUniqueID() {
    var uuid = DateFormat('yyMMddhhmmsssss').format(DateTime.now());
    return "SG$uuid";
  }
}
