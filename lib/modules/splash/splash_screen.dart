import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/constant/assets.gen.dart';
import 'package:kaltim_report/core/auth/bloc/auth_bloc.dart';
import 'package:kaltim_report/widgets/error_screen_placeholder.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(AuthStarted());

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthFailure) {
          return _buildAuthFailed(context);
        } else {
          return _buildAuthSuccess(context);
        }
      },
    );
  }

  Widget _buildAuthFailed(BuildContext context) {
    return Scaffold(
      body: ErrorPlaceholder(
        title: 'Ups Terjadi Kesalahan',
        subtitle: "Nampaknya ada kesalahan pada saat menauthentikasi akunmu",
        buttonText: "Logout",
        onTap: () {
          context.read<AuthBloc>().add(AuthLogout());
        },
      ),
    );
  }

  Widget _buildAuthSuccess(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Theme.of(context).brightness == Brightness.light
                  ? Assets.icons.logoTextLight.path
                  : Assets.icons.logoText.path,
              height: 6.h,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Aplikasi Siap Sedia Untukmu'),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
