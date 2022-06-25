import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_1.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_4.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_6.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_7.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/report/blocs/report_discussion/report_discussion_bloc.dart';
import 'package:kaltim_report/modules/report/blocs/report_discussion_send/report_discussion_send_bloc.dart';
import 'package:kaltim_report/modules/report/models/report_discussion_model.dart';
import 'package:kaltim_report/modules/report/models/report_model.dart';
import 'package:kaltim_report/utils/converter_helper.dart';
import 'package:kaltim_report/widgets/widgets.dart';
import 'package:sizer/sizer.dart';

class ReportDiscussionScreen extends StatefulWidget {
  final ReportModel data;
  const ReportDiscussionScreen({Key? key, required this.data})
      : super(key: key);

  @override
  State<ReportDiscussionScreen> createState() => _ReportDiscussionScreenState();
}

class _ReportDiscussionScreenState extends State<ReportDiscussionScreen> {
  final TextEditingController textEditingController = TextEditingController();

  late ReportDiscussionBloc reportDiscussionBloc;
  late ReportDiscussionSendBloc reportDiscussionSendBloc;

  String? reportComment;

  @override
  void initState() {
    reportDiscussionBloc = getIt.get<ReportDiscussionBloc>()
      ..add(ReportDiscussionListFetch(widget.data.id));
    reportDiscussionSendBloc = getIt.get<ReportDiscussionSendBloc>();
    super.initState();
  }

  @override
  void dispose() {
    reportDiscussionBloc.close();
    reportDiscussionSendBloc.close();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => reportDiscussionBloc,
        ),
        BlocProvider(
          create: (context) => reportDiscussionSendBloc,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: const AutoLeadingButton(),
          title: Text(
            'Diskusi Laporan',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          elevation: 1,
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ReportDiscussionBloc, ReportDiscussionState>(
                bloc: reportDiscussionBloc,
                builder: (context, state) {
                  if (state is ReportDiscussionListSuccess) {
                    if (state.data.isEmpty) {
                      return const Center(child: Text('Belum ada komentar'));
                    }
                    return _buildWidgetSuccess(state.data);
                  } else if (state is ReportDiscussionListFailed) {
                    return _buildWidgetFailed();
                  } else {
                    return _buildWidgetLoading();
                  }
                },
              ),
            ),
            _buildBottomNavBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildWidgetFailed() {
    return ErrorPlaceholder(
      title: 'Ups Terjadi Kesalahan',
      subtitle:
          'Jangan panik, kamu bisa memuat ulang data dengan menekan tombol dibawah ini!',
      onTap: () {
        reportDiscussionBloc.add(ReportDiscussionListFetch(widget.data.id));
      },
    );
  }

  Widget _buildWidgetSuccess(List<ReportDiscussionModel> data) {
    return ListView.separated(
      itemCount: data.length,
      physics: const BouncingScrollPhysics(),
      reverse: true,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      itemBuilder: (context, index) {
        final chat = data[index];

        if (chat.userId == widget.data.userId) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ChatBubble(
                clipper: ChatBubbleClipper4(type: BubbleType.sendBubble),
                backGroundColor: Colors.grey.shade600,
                alignment: Alignment.topRight,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.6,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        chat.userName!.replaceAll(RegExp(r'.(?=.{3})'), '*'),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.sp,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        chat.comment,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        ConverterHelper.differenceTimeParse(chat.dateInput),
                        style: TextStyle(
                          color: Colors.grey.shade100,
                          fontSize: 6.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const ProfileImageNetworkBuild(
                  imageUrl: "",
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          );
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const ProfileImageNetworkBuild(
                imageUrl: "",
                height: 30,
                width: 30,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            ChatBubble(
              backGroundColor: Colors.grey.shade200,
              clipper: ChatBubbleClipper4(type: BubbleType.receiverBubble),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.userName!.replaceAll(RegExp(r'.(?=.{3})'), '*'),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 8.sp,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      chat.comment,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10.sp,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      ConverterHelper.differenceTimeParse(chat.dateInput),
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 6.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      width: double.infinity,
      color: Colors.grey.shade300,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: ParagraphTextField(
                hint: 'Tulis komentar mu disini',
                controller: textEditingController,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (textEditingController.text.length > 4) {
                reportDiscussionSendBloc.add(
                  ReportDiscussionSendForm(
                    ReportDiscussionModel(
                      comment: textEditingController.text,
                      dateInput: DateTime.now(),
                      reportId: widget.data.id,
                    ),
                  ),
                );
                textEditingController.clear();
              } else {
                Fluttertoast.showToast(msg: "Masukkan minimal 5 karakter");
              }
            },
            child: const Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 10,
              ),
              child: Icon(
                Icons.send,
                color: Colors.black87,
              ),
            ),
          )
        ],
      ),
    );
  }
}
