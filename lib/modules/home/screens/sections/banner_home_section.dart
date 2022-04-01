import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/modules/home/blocs/banner/banner_bloc.dart';
import 'package:kaltim_report/utils/launcher_helper.dart';
import 'package:kaltim_report/widgets/custom_skeleton_builder.dart';
import 'package:kaltim_report/widgets/error_screen_placeholder.dart';
import 'package:kaltim_report/widgets/image_network_builder.dart';
import 'package:sizer/sizer.dart';

class BannerHomeSection extends StatefulWidget {
  const BannerHomeSection({Key? key}) : super(key: key);

  @override
  State<BannerHomeSection> createState() => _BannerHomeSectionState();
}

class _BannerHomeSectionState extends State<BannerHomeSection> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BannerBloc, BannerState>(
      builder: (context, state) {
        if (state is BannerSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCarouselSlider(state),
              _buildDotIndicator(state),
            ],
          );
        } else if (state is BannerFailed) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: ErrorPlaceholder(
              title: 'Yah Ada Kesalahan',
              subtitle: 'Silahkan refresh untuk memuat ulang data',
              onTap: () {
                context.read<BannerBloc>().add(BannerFetch());
              },
            ),
          );
        } else {
          return Container(
            margin: const EdgeInsets.only(
              left: 24,
              top: 20,
            ),
            height: 21.2.h,
            child: Column(
              children: [
                SkeletonLoaderSquare(
                  height: 18.h,
                  width: 85.w,
                  borderRadius: BorderRadius.circular(10),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SkeletonLoaderSquare(
                      height: 6,
                      width: 15,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ],
                )
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildDotIndicator(BannerSuccess state) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      child: DotsIndicator(
        dotsCount: state.data.length,
        position: _selectedIndex.toDouble(),
        decorator: DotsDecorator(
          activeColor: Colors.blueGrey,
          spacing: const EdgeInsets.all(2.0),
          size: const Size.square(6.0),
          activeSize: const Size(15.0, 6.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselSlider(BannerSuccess state) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 20.h,
        viewportFraction: 0.9,
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      items: state.data.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                LauncherHelper.openUrl(i.path);
              },
              child: Container(
                margin: const EdgeInsets.only(
                  top: 20.0,
                  right: 20.0,
                ),
                width: MediaQuery.of(context).size.width,
                height: 20.h,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor,
                      offset: const Offset(1, 1),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: ImageNetworkBuild(
                    imageUrl: i.imageUrl,
                    height: 20.h,
                    width: double.infinity,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
