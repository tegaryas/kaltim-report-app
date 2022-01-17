import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:kaltim_report/modules/auth/screens/login_screen.dart';
import 'package:kaltim_report/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 3.h,
              ),
              Text(
                'Selamat Datang',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
              Text(
                'Kaltim Report',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              _buildCarouselSlider(),
              _buildDotIndicator(),
              const Spacer(),
              CustomButton(
                text: "Masuk",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomButton(
                text: "Belum ada akun? daftar dulu",
                type: CustomButtonType.outline,
                onTap: () {},
              ),
              SizedBox(
                height: 2.h,
              ),
              _buildSyaratdanKetentuan(),
              SizedBox(
                height: 3.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDotIndicator() {
    return Center(
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
        height: 60.h,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50.h,
                  decoration: const BoxDecoration(color: Colors.amber),
                ),
                Text(
                  'Deteksi & laporkan daerah rawan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            );
          },
        );
      }).toList(),
    );
  }

  _buildSyaratdanKetentuan() {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Text(
            'Dengan menggunakan aplikasi, kamu setuju dengan ',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9.sp,
            ),
          ),
          Text(
            'Ketentuan Layanan',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9.sp,
              color: Colors.lightBlue,
            ),
          ),
          Text(
            ' dan ',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9.sp,
            ),
          ),
          Text(
            'Kebijakan Privasi',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 9.sp,
              color: Colors.lightBlue,
            ),
          ),
        ],
      ),
    );
  }
}
