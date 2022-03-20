import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kaltim_report/configs/routes/routes.gr.dart';
import 'package:kaltim_report/modules/news/blocs/news_list_new/news_list_new_bloc.dart';
import 'package:kaltim_report/modules/news/models/news_model.dart';
import 'package:kaltim_report/modules/news/screens/components/news_card.dart';
import 'package:kaltim_report/widgets/error_screen_placeholder.dart';
import 'package:sizer/sizer.dart';

class NewsTabView extends StatelessWidget {
  const NewsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsListNewBloc, NewsListNewState>(
      builder: (context, state) {
        if (state is NewsListNewSuccess) {
          return RefreshIndicator(
            onRefresh: () => Future.sync(() {
              state.pagingController.refresh();
            }),
            child: PagedListView<int, NewsModel>.separated(
              pagingController: state.pagingController,
              physics: const AlwaysScrollableScrollPhysics(),
              builderDelegate: PagedChildBuilderDelegate(
                itemBuilder: (context, entry, index) {
                  return NewsCard(
                    data: entry,
                    onTap: () {
                      if (entry.url != null) {
                        context.navigateTo(
                          NewsDetailRoute(newsUrl: entry.url!),
                        );
                      }
                    },
                  );
                },
                firstPageErrorIndicatorBuilder: (context) {
                  return ErrorPlaceholder(
                    title: 'Ups Terjadi Kesalahan',
                    subtitle:
                        'Jangan panik, kamu bisa memuat ulang data dengan menekan tombol dibawah ini!',
                    onTap: () {
                      state.pagingController.refresh();
                    },
                  );
                },
              ),
              padding: const EdgeInsets.only(
                bottom: 40,
                top: 20,
              ),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Divider(
                  height: 5.h,
                  thickness: 1,
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
