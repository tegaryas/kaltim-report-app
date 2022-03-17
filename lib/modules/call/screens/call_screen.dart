import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/modules/call/blocs/calls/call_bloc.dart';
import 'package:kaltim_report/utils/launcher_helper.dart';
import 'package:kaltim_report/widgets/image_network_builder.dart';
import 'package:sizer/sizer.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "SiMergency",
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
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
              itemCount: state.calls.length,
              itemBuilder: (context, index) {
                var emergencyCall = state.calls[index];
                return InkWell(
                  onTap: () {
                    LauncherHelper.launchCaller(emergencyCall.numberPhone);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        ImageNetworkBuild(
                          imageUrl: emergencyCall.imageUrl,
                          height: 5.h,
                          width: 5.h,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          emergencyCall.name,
                          style: TextStyle(
                            fontSize: 11.sp,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.call,
                          size: 18.sp,
                        )
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
}
