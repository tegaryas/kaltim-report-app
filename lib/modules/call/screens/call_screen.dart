import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/call/blocs/calls/call_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SiMergency",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: BlocBuilder<CallBloc, CallState>(
        builder: (context, state) {
          if (state is CallLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CallLoaded) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
              ),
              itemCount: state.calls.length,
              itemBuilder: (context, index) {
                var emergencyCall = state.calls[index];
                return InkWell(
                  onTap: () {
                    _launchCaller(emergencyCall.numberPhone);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15.sp,
                        ),
                        SizedBox(
                          width: 2.5.w,
                        ),
                        Text(emergencyCall.name),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 1.h,
                );
              },
            );
          }
          return const Center(
            child: Text("Emergency Call Error"),
          );
        },
      ),
    );
  }

  _launchCaller(int phoneNumber) async {
    var url = "tel:${phoneNumber.toString()}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
