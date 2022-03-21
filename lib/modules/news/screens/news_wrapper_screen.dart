import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/modules/news/blocs/news_list_new/news_list_new_bloc.dart';

class NewsWrapperScreen extends StatelessWidget {
  const NewsWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsListNewBloc>(
          create: (context) =>
              getIt.get<NewsListNewBloc>()..add(const NewsListNewStarted()),
        ),
      ],
      child: const AutoRouter(),
    );
  }
}
