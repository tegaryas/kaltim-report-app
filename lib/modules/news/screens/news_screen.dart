import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kaltim_report/configs/injectable/injectable_core.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/news/blocs/news_list_new/news_list_new_bloc.dart';
import 'package:kaltim_report/modules/news/models/news_filter_model.dart';
import 'package:kaltim_report/modules/news/models/news_model.dart';
import 'package:kaltim_report/modules/news/screens/components/news_card.dart';
import 'package:kaltim_report/modules/news/screens/components/news_tab_view.dart';
import 'package:sizer/sizer.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsListNewBloc>(
      create: (context) =>
          getIt.get<NewsListNewBloc>()..add(const NewsListNewStarted()),
      child: Scaffold(
        body: DefaultTabController(
          length: 5,
          initialIndex: 0,
          child: NestedScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  title: Text(
                    "SiBerita",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  pinned: true,
                  floating: true,
                  bottom: const PreferredSize(
                    preferredSize: Size.fromHeight(50),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        isScrollable: true,
                        tabs: [
                          Tab(
                            child: Text("Terbaru"),
                          ),
                          Tab(
                            child: Text("Kesehatan"),
                          ),
                          Tab(
                            child: Text("Teknologi"),
                          ),
                          Tab(
                            child: Text("Bisnis"),
                          ),
                          Tab(
                            child: Text("Olahraga"),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                BlocProvider<NewsListNewBloc>(
                  create: (context) => getIt.get<NewsListNewBloc>()
                    ..add(const NewsListNewStarted()),
                  child: const NewsTabView(),
                ),
                BlocProvider<NewsListNewBloc>(
                  create: (context) => getIt.get<NewsListNewBloc>()
                    ..add(const NewsListNewStarted(
                        category: NewsCategory.health)),
                  child: const NewsTabView(),
                ),
                BlocProvider<NewsListNewBloc>(
                  create: (context) => getIt.get<NewsListNewBloc>()
                    ..add(const NewsListNewStarted(
                        category: NewsCategory.technology)),
                  child: const NewsTabView(),
                ),
                BlocProvider<NewsListNewBloc>(
                  create: (context) => getIt.get<NewsListNewBloc>()
                    ..add(const NewsListNewStarted(
                        category: NewsCategory.business)),
                  child: const NewsTabView(),
                ),
                BlocProvider<NewsListNewBloc>(
                  create: (context) => getIt.get<NewsListNewBloc>()
                    ..add(const NewsListNewStarted(
                        category: NewsCategory.sports)),
                  child: const NewsTabView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
