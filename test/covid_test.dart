import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaltim_report/modules/home/blocs/home_covid/home_covid_bloc.dart';
import 'package:kaltim_report/modules/home/models/covid_feature_model.dart';
import 'package:kaltim_report/modules/home/providers/home_provider.dart';
import 'package:kaltim_report/modules/home/repositories/home_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'covid_test.mocks.dart';

@GenerateMocks([
  HomeRepository,
  HomeProvider,
])
void main() {
  final MockHomeProvider homeProvider = MockHomeProvider();
  final HomeRepository homeRepository =
      HomeRepository(homeProvider: homeProvider);

  group('Test Covid Bloc', () {
    group('Given User Try To Fetch Covid Feature,', () {
      when(homeRepository.getCovidFeature())
          .thenAnswer((_) => Future.value(<CovidFeatureConfigModel>[]));

      blocTest("When Success, should emits [Success]",
          build: () => HomeCovidBloc(homeRepository),
          act: (HomeCovidBloc bloc) => bloc.add(HomeCovidFetch()),
          expect: () =>
              [HomeCovidLoading(), const HomeCovidSuccess(config: [])],
          verify: (_) {
            verify(homeRepository.getCovidFeature()).called(1);
          });
    });
  });
}
