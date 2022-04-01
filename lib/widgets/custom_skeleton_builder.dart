import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonLoaderSquare extends StatelessWidget {
  const SkeletonLoaderSquare({
    Key? key,
    required this.height,
    required this.width,
    this.borderRadius,
    this.randonLength,
  }) : super(key: key);

  final double height;
  final double width;
  final BorderRadius? borderRadius;
  final bool? randonLength;

  @override
  Widget build(BuildContext context) {
    return SkeletonLine(
      style: SkeletonLineStyle(
        height: height,
        width: width,
        randomLength: randonLength,
        borderRadius: borderRadius ?? BorderRadius.circular(50),
      ),
    );
  }
}

class SkeletonLoaderCircle extends StatelessWidget {
  const SkeletonLoaderCircle({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SkeletonAvatar(
      style: SkeletonAvatarStyle(
        height: height,
        width: width,
        shape: BoxShape.circle,
      ),
    );
  }
}
