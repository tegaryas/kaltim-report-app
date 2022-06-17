import 'package:flutter/material.dart';
import 'package:kaltim_report/widgets/custom_skeleton_builder.dart';

class ImageNetworkBuild extends StatelessWidget {
  const ImageNetworkBuild({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width,
  }) : super(key: key);

  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl,
        height: height,
        width: width,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => SizedBox(
              height: height,
              width: width,
              child: const Center(
                child: Icon(
                  Icons.error,
                ),
              ),
            ),
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return SkeletonLoaderSquare(
            height: height,
            width: width,
            borderRadius: BorderRadius.circular(0),
          );
        });
  }
}

class ProfileImageNetworkBuild extends StatelessWidget {
  const ProfileImageNetworkBuild({
    Key? key,
    required this.imageUrl,
    required this.height,
    required this.width,
  }) : super(key: key);

  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl,
        height: height,
        width: width,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => SizedBox(
              height: height,
              width: width,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: Center(
                  child: Icon(
                    Icons.person,
                    size: height,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return SkeletonLoaderSquare(
            height: height,
            width: width,
            borderRadius: BorderRadius.circular(0),
          );
        });
  }
}
