import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/home/blocs/feature/feature_bloc.dart';
import 'package:kaltim_report/modules/home/models/feature_model.dart';
import 'package:kaltim_report/widgets/image_network_builder.dart';
import 'package:sizer/sizer.dart';

class FeatureHomeSection extends StatelessWidget {
  const FeatureHomeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<FeatureBloc>()..add(FeatureFetching()),
      child: BlocBuilder<FeatureBloc, FeatureState>(
        builder: (context, state) {
          if (state is FeatureLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  state.feature.take(5).toList().length,
                  (index) {
                    if (index == 4) {
                      return GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            builder: (context) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 15,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 0.4.h,
                                          width: 10.w,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade400,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      'Pilih Layanan',
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: GridView.extent(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        maxCrossAxisExtent: 13.h,
                                        children: List.generate(
                                          state.feature.length,
                                          (index) => GestureDetector(
                                            onTap: () {
                                              context.navigateTo(PageRouteInfo(
                                                  state.feature[index].route,
                                                  path: state
                                                      .feature[index].path));
                                            },
                                            child: _buildFeatureContainer(
                                              state.feature[index],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: SizedBox(
                          width: 13.w,
                          height: 8.h,
                          child: Column(
                            children: [
                              ImageNetworkBuild(
                                imageUrl:
                                    'https://firebasestorage.googleapis.com/v0/b/kaltim-report.appspot.com/o/icons%2Fmore.png?alt=media&token=4b079a29-3086-45ea-adee-f7058658c7e5',
                                height: 4.5.h,
                                width: 4.5.h,
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                'Lainnya',
                                style: TextStyle(
                                  fontSize: 8.sp,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () {
                        context.navigateTo(PageRouteInfo(
                            state.feature[index].route,
                            path: state.feature[index].path));
                      },
                      child: _buildFeatureContainer(
                        state.feature[index],
                      ),
                    );
                  },
                ),
              ),
            );
          }
          if (state is FeatureLoading) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  5,
                  (index) => _buildFeatureLoading(),
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}

Widget _buildFeatureContainer(FeatureModel feature) {
  return SizedBox(
    width: 13.w,
    height: 8.h,
    child: Column(
      children: [
        ImageNetworkBuild(
          imageUrl: feature.imageUrl,
          height: 4.5.h,
          width: 4.5.h,
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          feature.name,
          style: TextStyle(
            fontSize: 8.sp,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    ),
  );
}

Widget _buildFeatureLoading() {
  return SizedBox(
    width: 13.w,
    height: 8.h,
    child: Column(
      children: [
        Container(
          height: 4.5.h,
          width: 4.5.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        Container(
          height: 0.6.h,
          width: 5.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
          ),
        ),
      ],
    ),
  );
}
