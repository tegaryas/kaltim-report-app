import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/home/blocs/home_covid/home_covid_bloc.dart';
import 'package:kaltim_report/modules/home/models/covid_feature_model.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/widgets/custom_skeleton_builder.dart';
import 'package:kaltim_report/widgets/error_screen_placeholder.dart';
import 'package:kaltim_report/widgets/image_network_builder.dart';
import 'package:sizer/sizer.dart';

class CovidHomeSection extends StatelessWidget {
  const CovidHomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            'Sangatta Tanggap Covid-19',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            'Tetap aman, sehat, dan produktif selama masa pandemi Covid-19',
            style: TextStyle(
              fontSize: 10.sp,
              color: AppColors.textFaded,
              height: 1.5,
            ),
          ),
        ),
        SizedBox(
          height: 2.5.h,
        ),
        BlocBuilder<HomeCovidBloc, HomeCovidState>(
          builder: (context, state) {
            if (state is HomeCovidSuccess) {
              return _buildWidgetSuccess(state.config, context);
            } else if (state is HomeCovidFailed) {
              return _buildWidgetFailed(context);
            } else {
              return _buildWigetLoading(context);
            }
          },
        ),
      ],
    );
  }

  Widget _buildWidgetSuccess(
      List<CovidFeatureConfigModel> config, BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.only(
          left: 20,
          bottom: 10,
          top: 10,
        ),
        child: Row(
          children: List.generate(
            config.length,
            (index) => _buildCardCovidFeature(
              context,
              data: config[index],
              onTap: () {
                if (config[index].actionType == FeatureActionType.screen &&
                    config[index].path != null) {
                  context.router.root.navigateNamed(config[index].path!,
                      includePrefixMatches: true);
                } else if (config[index].actionType == FeatureActionType.url &&
                    config[index].path != null) {
                  context.pushRoute(WebviewRoute(
                      webUrl: config[index].path!, title: config[index].title));
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetFailed(BuildContext context) {
    return ErrorPlaceholder(
      title: 'Ups ada kesalahan',
      subtitle: 'Silahkan tekan tombol dibawah ini untuk memuat ulang data',
      onTap: () {
        context.read<HomeCovidBloc>().add(HomeCovidFetch());
      },
    );
  }

  Widget _buildWigetLoading(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 20,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            3,
            (index) => Container(
              height: 18.h,
              width: 32.w,
              margin: const EdgeInsets.only(
                right: 20,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(3, 3),
                    blurRadius: 12,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Column(
                children: [
                  SkeletonLoaderSquare(
                    height: 10.h,
                    width: 32.w,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  const SkeletonLoaderSquare(
                    height: 10,
                    width: 100,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  const SkeletonLoaderSquare(
                    height: 8,
                    width: 70,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardCovidFeature(
    BuildContext context, {
    required CovidFeatureConfigModel data,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 145,
        width: 32.w,
        margin: const EdgeInsets.only(
          right: 20,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 12,
              color: Colors.black12,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              child: ImageNetworkBuild(
                imageUrl: data.image!,
                height: 70,
                width: double.infinity,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    data.subtitle,
                    style: TextStyle(
                      fontSize: 8.sp,
                      height: 1.5,
                      color: AppColors.textFaded,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
