import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

enum CustomButtonType {
  outline,
  solid,
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      this.type = CustomButtonType.solid,
      required this.onTap,
      this.isLoading = false,
      this.textSize})
      : super(key: key);

  final String text;
  final CustomButtonType type;
  final Function() onTap;
  final bool isLoading;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: 5.5.h,
        width: 100.w,
        decoration: type == CustomButtonType.solid
            ? BoxDecoration(
                color: isLoading
                    ? const Color(0xFF1E9E9C).withOpacity(0.3)
                    : const Color(0xFF1E9E9C),
                borderRadius: BorderRadius.circular(50),
              )
            : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: const Color(0xFF1E9E9C),
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
                    fontSize: textSize ?? 10.sp,
                    color: type == CustomButtonType.solid
                        ? Colors.white
                        : const Color(0xFF1E9E9C),
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
    this.isLoading = false,
  }) : super(key: key);

  final String text;
  final CustomButtonType type;
  final Function() onTap;
  final String imageUrl;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        height: 5.5.h,
        decoration: type == CustomButtonType.solid
            ? BoxDecoration(
                color: const Color(0xFF1E9E9C),
                borderRadius: BorderRadius.circular(50),
              )
            : BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: const Color(0xFF1E9E9C),
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
                      : const Color(0xFF1E9E9C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
