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
    this.isLoading = false,
  }) : super(key: key);

  final String text;
  final CustomButtonType type;
  final Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: 5.5.h,
        width: 100.w,
        decoration: type == CustomButtonType.solid
            ? BoxDecoration(
                color: isLoading ? Colors.blueGrey.shade200 : Colors.blueGrey,
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
          child: isLoading
              ? SizedBox(
                  height: 20.sp,
                  width: 20.sp,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1,
                  ),
                )
              : Text(
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
