import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/onboard/data/onboarding_data.dart';
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
            horizontal: 20.0,
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
              SizedBox(
                height: 0.5.h,
              ),
              Text(
                'Singa Gembara App',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              _buildCarouselSlider(),
              const Spacer(),
              _buildDotIndicator(),
              SizedBox(
                height: 2.h,
              ),
              CustomButton(
                text: "Masuk",
                onTap: () {
                  context.router.push(const LoginRoute());
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              CustomButton(
                text: "Belum ada akun? daftar dulu",
                type: CustomButtonType.outline,
                onTap: () {
                  context.router.push(const RegisterRoute());
                },
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
        dotsCount: data.length,
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
        height: 55.h,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          setState(() {
            _selectedIndex = index;
          });
        },
        scrollPhysics: const BouncingScrollPhysics(),
      ),
      items: data.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 4.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 35.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(i.imageAssets),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  i.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  i.subtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 10.sp,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
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
              color: Theme.of(context).colorScheme.secondary,
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
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
