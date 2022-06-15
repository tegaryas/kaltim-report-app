import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/modules/emergency/blocs/emergency_call_list/emergency_call_list_bloc.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/utils/converter_helper.dart';
import 'package:kaltim_report/utils/launcher_helper.dart';
import 'package:kaltim_report/widgets/error_screen_placeholder.dart';
import 'package:sizer/sizer.dart';

class EmergencyCallListScreen extends StatelessWidget {
  const EmergencyCallListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Panggilan Darurat Warga',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: BlocBuilder<EmergencyCallListBloc, EmergencyCallListState>(
        builder: (context, state) {
          if (state is EmergencyCallListSuccess) {
            return RefreshIndicator(
              onRefresh: () => Future.sync(() => context
                  .read<EmergencyCallListBloc>()
                  .add(EmergencyCallListFetch())),
              child: ListView.separated(
                itemCount: state.data.length,
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Divider(
                      height: 5,
                      color: AppColors.textFaded,
                    ),
                  );
                },
                itemBuilder: (context, index) {
                  final data = state.data[index];
                  return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.name!,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  ConverterHelper
                                      .convertDateTimeToFullDateFormat(
                                          data.dateInput, context),
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              LauncherHelper.launchCaller(data.phoneNumber!);
                            },
                            icon: const Icon(
                              Icons.call,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            onPressed: () {
                              LauncherHelper.launchMaps(data.location);
                            },
                            icon: const Icon(
                              Icons.map,
                            ),
                          )
                        ],
                      ));
                },
              ),
            );
          } else if (state is EmergencyCallListFailed) {
            return ErrorPlaceholder(
              title: 'Ups Terjadi Kesalahan',
              subtitle:
                  'Kamu bisa menekan tombol dibawah ini untuk memuat ulang data',
              onTap: () {
                context
                    .read<EmergencyCallListBloc>()
                    .add(EmergencyCallListFetch());
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
