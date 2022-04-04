import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StatusReportBadge extends StatelessWidget {
  const StatusReportBadge({
    Key? key,
    required this.status,
    required this.backgroundColor,
  }) : super(key: key);

  final String status;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 9.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
