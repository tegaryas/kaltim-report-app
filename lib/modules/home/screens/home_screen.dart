import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
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
                    vertical: 10,
                  ),
                  height: 20.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 1.h,
                      ),
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileLoaded) {
                            return Text(
                              'Halo ${state.profile.name.split(' ').first}!',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            );
                          }

                          return Text(
                            'Halo,',
                            style: TextStyle(
                              fontSize: 14.sp,
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
                          fontSize: 9.sp,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 13.h,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4.h,
                      ),
                      _buildFeatureWidget(),
                      _buildCarouselSlider(),
                      _buildDotIndicator(),
                      Divider(
                        thickness: 3,
                        height: 6.h,
                        color: Colors.grey.shade200,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Text(
                              'Sangatta Tanggap Covid-19',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
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
                                color: Colors.black45,
                                height: 1.5,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              margin: const EdgeInsets.only(
                                left: 20,
                                bottom: 10,
                                top: 10,
                              ),
                              child: Row(
                                children: List.generate(
                                  3,
                                  (index) => _buildCardCovidFeature(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 3,
                        height: 6.h,
                        color: Colors.grey.shade200,
                      ),
                      _buildLaporanSection()
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container _buildCardCovidFeature() {
    return Container(
      height: 18.h,
      width: 32.w,
      margin: const EdgeInsets.only(
        right: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
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
              imageUrl:
                  "https://dinkes.acehprov.go.id/uploads/Ilustrasi_Vaksinasi1.jpg",
              height: 10.h,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 2.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.5.h,
                ),
                Text(
                  'Data Vaksinasi',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
                Text(
                  'Cek data vaksinasi di daerah mu',
                  style: TextStyle(
                    fontSize: 8.sp,
                    color: Colors.black45,
                    height: 1.5,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLaporanSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Text(
            'Laporan Anda',
            style: TextStyle(
              fontSize: 11.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          height: 20.h,
          width: 100.w,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              "assets/images/onboarding_slide1.png",
            ),
          )),
        ),
        SizedBox(
          height: 1.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Text(
            'Kalau kamu sudah buat laporan, laporan terakhirmu akan muncul disini.',
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black38,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
      ],
    );
  }

  Widget _buildFeatureWidget() {
    return BlocBuilder<FeatureBloc, FeatureState>(
      builder: (context, state) {
        if (state is FeatureLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                state.feature.length,
                (index) => GestureDetector(
                  onTap: () {
                    switch (state.feature[index].type) {
                      case FeatureType.siLapor:
                        context.router.push(const ReportRouter());
                        break;
                      case FeatureType.siBerita:
                        context.navigateTo(const NewsRoute());
                        break;
                      case FeatureType.siDarurat:
                        context.navigateTo(const CallRoute());
                        break;
                      case FeatureType.lainnya:
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
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Wrap(
                                        alignment: WrapAlignment.spaceAround,
                                        spacing: 8.w,
                                        runSpacing: 5.w,
                                        children: List.generate(
                                          state.feature.length - 1,
                                          (index) => _buildFeatureContainer(
                                            state.feature[index],
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
                            });
                        break;
                      default:
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
                5,
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
