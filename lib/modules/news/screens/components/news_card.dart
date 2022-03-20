import 'package:flutter/material.dart';
import 'package:kaltim_report/modules/news/models/news_model.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/utils/converter_helper.dart';
import 'package:kaltim_report/widgets/image_network_builder.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletons/skeletons.dart';

class NewsCard extends StatelessWidget {
  final NewsModel data;
  final Function()? onTap;
  const NewsCard({
    Key? key,
    required this.data,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ImageNetworkBuild(
                imageUrl: data.urlToImage ?? "",
                height: 10.h,
                width: 10.h,
              ),
            ),
            SizedBox(
              width: 6.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                      height: 1.5,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    ConverterHelper.convertDateTimeToDateFormat(
                        data.publishedAt, context),
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 9.sp,
                      color: AppColors.textFaded,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget loader() => const _NewsCardLoader();
}

class _NewsCardLoader extends StatelessWidget {
  const _NewsCardLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        children: [
          SkeletonAvatar(
            style: SkeletonAvatarStyle(
              shape: BoxShape.rectangle,
              width: 40.sp,
              height: 40.sp,
            ),
          ),
          SizedBox(
            width: 1.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                    lines: 2,
                    spacing: 0.8.h,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 10,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SkeletonParagraph(
                  style: SkeletonParagraphStyle(
                    lines: 1,
                    spacing: 0.8.h,
                    lineStyle: SkeletonLineStyle(
                      randomLength: true,
                      height: 10,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
