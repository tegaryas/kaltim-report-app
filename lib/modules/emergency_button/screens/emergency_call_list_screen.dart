import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/emergency_button/blocs/emergency_call_list/emergency_call_list_bloc.dart';
import 'package:kaltim_report/modules/emergency_button/models/emergency_call_model.dart';
import 'package:kaltim_report/theme.dart';
import 'package:kaltim_report/utils/converter_helper.dart';
import 'package:kaltim_report/utils/launcher_helper.dart';
import 'package:kaltim_report/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

class EmergencyCallListScreen extends StatelessWidget {
  final bool isAdmin;
  const EmergencyCallListScreen({Key? key, required this.isAdmin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmergencyCallListBloc>(
      create: (context) =>
          getIt.get<EmergencyCallListBloc>()..add(EmergencyCallListFetch()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Panggilan Darurat Warga',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: BlocConsumer<EmergencyCallListBloc, EmergencyCallListState>(
          listener: (context, state) {
            if (state is EmergencyCallListSuccess) {
              if (state.data.isEmpty) {
                context.popRoute();
              }
            }
          },
          builder: (context, state) {
            if (state is EmergencyCallListSuccess) {
              return _buildWidgetSuccess(context, state, isAdmin);
            } else if (state is EmergencyCallListFailed) {
              return _buildWidgetFailed(context);
            } else {
              return _buildWidgetLoading();
            }
          },
        ),
      ),
    );
  }

  Widget _buildWidgetLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildWidgetFailed(BuildContext context) {
    return ErrorPlaceholder(
      title: 'Ups Terjadi Kesalahan',
      subtitle: 'Kamu bisa menekan tombol dibawah ini untuk memuat ulang data',
      onTap: () {
        context.read<EmergencyCallListBloc>().add(EmergencyCallListFetch());
      },
    );
  }

  Widget _buildWidgetSuccess(
      BuildContext context, EmergencyCallListSuccess state, bool isAdmin) {
    return RefreshIndicator(
      onRefresh: () => Future.sync(() =>
          context.read<EmergencyCallListBloc>().add(EmergencyCallListFetch())),
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
          return isAdmin
              ? DismissibleEmergencyCard(data: data)
              : EmergencyCallCard(data: data);
        },
      ),
    );
  }
}

class EmergencyCallCard extends StatelessWidget {
  const EmergencyCallCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final EmergencyCallModel data;

  @override
  Widget build(BuildContext context) {
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
                    height: 8,
                  ),
                  Text(
                    ConverterHelper.convertDateTimeToFullDateFormat(
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
  }
}

class DismissibleEmergencyCard extends StatelessWidget {
  const DismissibleEmergencyCard({Key? key, required this.data})
      : super(key: key);

  final EmergencyCallModel data;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(data.userId!),
      confirmDismiss: ((direction) async {
        return await _modalConfirmationDelete(context);
      }),
      onDismissed: ((direction) {
        context
            .read<EmergencyCallListBloc>()
            .add(EmergencyCallListRemoveById(id: data.userId!));

        context.read<EmergencyCallListBloc>().add(EmergencyCallListFetch());
      }),
      dismissThresholds: const {
        DismissDirection.startToEnd: 1,
        DismissDirection.endToStart: 0.3
      },
      background: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        color: Colors.green,
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.check_circle,
          color: Colors.white,
        ),
      ),
      child: Container(
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
                      height: 8,
                    ),
                    Text(
                      ConverterHelper.convertDateTimeToFullDateFormat(
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
          )),
    );
  }

  Future<dynamic> _modalConfirmationDelete(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Apakah sudah ditangani?',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'Pastikan panggilan darurat telah selesai diproses sebelum melakukan penghapusan data!',
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColors.textFaded,
                    height: 1.5,
                  ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: 'Selesai',
                        onTap: () {
                          context.popRoute(true);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomButton(
                        text: 'Batal',
                        type: CustomButtonType.outline,
                        onTap: () {
                          context.popRoute(false);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
