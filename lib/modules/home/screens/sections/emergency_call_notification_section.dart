import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/emergency/blocs/emergency_call_list/emergency_call_list_bloc.dart';
import 'package:kaltim_report/modules/emergency/blocs/emergency_call_stream/emergency_call_stream_bloc.dart';
import 'package:kaltim_report/modules/emergency/models/emergency_call_model.dart';
import 'package:kaltim_report/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class EmergencyCallNotificationSection extends StatelessWidget {
  final bool isAdmin;
  const EmergencyCallNotificationSection({Key? key, required this.isAdmin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmergencyCallStreamBloc, EmergencyCallStreamState>(
      builder: (context, state) {
        if (state is EmergencyCallStreamSuccess) {
          if (state.data.isEmpty) {
            return Container();
          }
          return _buildWidgetSuccess(context, state.data);
        } else if (state is EmergencyCallStreamFailed) {
          return _buildWidgetFailed(context);
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildWidgetSuccess(
      BuildContext context, List<EmergencyCallModel> data) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          context.pushRoute(EmergencyCallRouter(
              children: [EmergencyCallListRoute(isAdmin: isAdmin)]));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).errorColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pemberitahuan",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Sekarang lagi ada ${data.length} warga yang meminta bantuan, segera bantu ke lokasi mereka!",
                      style: TextStyle(
                        fontSize: 9.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWidgetFailed(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ups Terjadi kesalahan',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Kamu bisa menekan tombol di samping untuk menghubungkan ulang',
                  style: TextStyle(
                    fontSize: 8.sp,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 60,
            child: CustomButton(
              text: 'Ulangi',
              textSize: 8.sp,
              onTap: () {
                context
                    .read<EmergencyCallListBloc>()
                    .add(EmergencyCallListFetch());
              },
            ),
          )
        ],
      ),
    );
  }
}
