import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushBar {
  static Flushbar createSuccess(
      {required String message,
      String? title,
      Duration duration = const Duration(seconds: 3)}) {
    return Flushbar(
      title: title,
      message: message,
      icon: Icon(
        Icons.check_circle,
        color: Colors.green[300],
      ),
      leftBarIndicatorColor: Colors.green[300],
      duration: duration,
    );
  }
}
