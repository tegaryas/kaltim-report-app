import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaltim_report/modules/gempa_bumi/blocs/gempa_bumi_bloc/gempa_bumi_bloc.dart';
import 'package:kaltim_report/modules/gempa_bumi/blocs/gempa_bumi_last_recently_bloc/gempa_bumi_last_recently_bloc.dart';
import 'package:kaltim_report/modules/gempa_bumi/blocs/gempa_bumi_magnetudo_bloc/gempa_bumi_magnetudo_bloc.dart';
import 'package:kaltim_report/modules/gempa_bumi/models/gempa_bumi_model.dart';
import 'package:kaltim_report/modules/gempa_bumi/providers/gempa_bumi_provider.dart';
import 'package:kaltim_report/modules/gempa_bumi/repositories/gempa_bumi_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'gempa_bumi_test.mocks.dart';

@GenerateMocks([
  GempaBumiRepository,
  GempaBumiProvider,
])
void main() {
  final MockGempaBumiProvider gempaProvider = MockGempaBumiProvider();
  final GempaBumiRepository gempaRepository =
      GempaBumiRepository(gempaProvider);

  group('Test Gempa Bloc', () {
    group('Given User Try To Fetch Gempa Bumi,', () {
      final GempaBumiModel gempaBumiModel = GempaBumiModel(
        tanggal: "12-12-2022",
        jam: "jam",
        dateTime: DateTime.now(),
        coordinates: '0,0',
        lintang: 'LT',
        bujur: 'LB',
        magnitude: '4',
        kedalaman: '12',
        wilayah: 'JAKARTA',
      );

      when(gempaRepository.getCurrentEarthQuake())
          .thenAnswer((_) => Future.value(gempaBumiModel));

      blocTest("When Success, should emits [Success]",
          build: () => GempaBumiBloc(gempaRepository),
          act: (GempaBumiBloc bloc) => bloc.add(GempaBumiFetch()),
          expect: () =>
              [GempaBumiLoading(), GempaBumiSuccess(data: gempaBumiModel)],
          verify: (_) {
            verify(gempaRepository.getCurrentEarthQuake()).called(1);
          });
    });

    group('Given User Try To Fetch Recently Gempa Bumi,', () {
      when(gempaRepository.getAllEarthQuake())
          .thenAnswer((_) => Future.value(<GempaBumiModel>[]));

      blocTest("When Success, should emits [Success]",
          build: () => GempaBumiLastRecentlyBloc(gempaRepository),
          act: (GempaBumiLastRecentlyBloc bloc) =>
              bloc.add(GempaBumiLastRecentlyFetch()),
          expect: () => [
                GempaBumiLastRecentlyLoading(),
                const GempaBumiLastRecentlySuccess(data: <GempaBumiModel>[])
              ],
          verify: (_) {
            verify(gempaRepository.getAllEarthQuake()).called(1);
          });
    });

    group('Given User Try To Fetch 5 Magnitude Gempa Bumi,', () {
      when(gempaRepository.getLastDayEarthQuake())
          .thenAnswer((_) => Future.value(<GempaBumiModel>[]));

      blocTest("When Success, should emits [Success]",
          build: () => GempaBumiMagnetudoBloc(gempaRepository),
          act: (GempaBumiMagnetudoBloc bloc) =>
              bloc.add(GempaBumiMagnetudoFetch()),
          expect: () => [
                GempaBumiMagnetudoLoading(),
                const GempaBumiMagnetudoSuccess(data: <GempaBumiModel>[])
              ],
          verify: (_) {
            verify(gempaRepository.getLastDayEarthQuake()).called(1);
          });
    });
  });
}
