import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/home/blocs/feature/feature_bloc.dart';
import 'package:kaltim_report/modules/home/models/feature_model.dart';
import 'package:kaltim_report/modules/profile/blocs/profile/profile_bloc.dart';
import 'package:kaltim_report/widgets/image_network_builder.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'SIGAP',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  height: 22.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileLoaded) {
                            return Text(
                              'Halo, ${state.profile.name.split(' ').first}!',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          }

                          return Text(
                            'Halo,',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        'Laporankan kejadian disekitar mu dengan mudah, silahkan tekan tombol tambah untuk membuat laporan',
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    _buildCarouselSlider(),
                    _buildDotIndicator(),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            _buildFeatureWidget(),
            SizedBox(
              height: 4.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureWidget() {
    return BlocBuilder<FeatureBloc, FeatureState>(
      builder: (context, state) {
        if (state is FeatureLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                state.feature.length,
                (index) => GestureDetector(
                  onTap: () {
                    if (state.feature[index].type == FeatureType.siLapor) {
                      context.router.push(const ReportRouter());
                    }
                    if (state.feature[index].type == FeatureType.siBerita) {
                      context.navigateTo(const NewsRoute());
                    }
                  },
                  child: _buildFeatureContainer(
                    state.feature[index],
                  ),
                ),
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
                4,
                (index) => _buildFeatureLoading(),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }

  Widget _buildFeatureContainer(FeatureModel feature) {
    return SizedBox(
      width: 20.w,
      height: 10.h,
      child: Column(
        children: [
          ImageNetworkBuild(
            imageUrl: feature.imageUrl,
            height: 5.5.h,
            width: 5.5.h,
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            feature.name,
            style: TextStyle(
              fontSize: 10.sp,
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
      width: 20.w,
      height: 10.h,
      child: Column(
        children: [
          Container(
            height: 6.h,
            width: 6.h,
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
            width: 6.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
      ),
      child: DotsIndicator(
        dotsCount: 5,
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

  Widget _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 20.h,
        viewportFraction: 0.9,
        onPageChanged: (index, reason) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.only(
                right: 10.0,
                top: 20.0,
              ),
              width: MediaQuery.of(context).size.width,
              height: 20.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
