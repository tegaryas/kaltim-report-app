import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

enum CustomButtonType {
  outline,
  solid,
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    this.type = CustomButtonType.solid,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final CustomButtonType type;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 5.5.h,
        width: 100.w,
        decoration: type == CustomButtonType.solid
            ? BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(50),
              )
            : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.blueGrey,
                ),
              ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10.sp,
              color: type == CustomButtonType.solid
                  ? Colors.white
                  : Colors.blueGrey,
            ),
          ),
        ),
      ),
    );
  }
}

class SocialCustomButton extends StatelessWidget {
  const SocialCustomButton({
    Key? key,
    required this.text,
    this.type = CustomButtonType.solid,
    required this.onTap,
    required this.imageUrl,
  }) : super(key: key);

  final String text;
  final CustomButtonType type;
  final Function() onTap;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 5.5.h,
        width: 100.w,
        decoration: type == CustomButtonType.solid
            ? BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(50),
              )
            : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: Colors.blueGrey,
                ),
              ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imageUrl,
                height: 20,
                width: 20,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp,
                  color: type == CustomButtonType.solid
                      ? Colors.white
                      : Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
