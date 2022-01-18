import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
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
        automaticallyImplyLeading: false,
        title: Text(
          'SIGEL',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.blueGrey,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 20,
            ),
            child: Text(
              'Terbaru di Singa Gembara',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          _buildCarouselSlider(),
          _buildDotIndicator(),
          SizedBox(
            height: 2.h,
          ),
          GestureDetector(
            onTap: () {
              context.router.push(const ReportRoute());
            },
            child: Center(
              child: Text(
                'To Report Screen',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
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
