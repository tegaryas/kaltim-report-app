import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kaltim_report/modules/call/blocs/calls/call_bloc.dart';
import 'package:kaltim_report/modules/call/providers/call_provider.dart';
import 'package:kaltim_report/modules/call/repositories/call_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'emergency_call_test.mocks.dart';

@GenerateMocks([
  CallRepository,
  CallProvider,
])
void main() {
  final MockCallProvider callProvider = MockCallProvider();
  final CallRepository callRepository =
      CallRepository(callProvider: callProvider);

  group('Test Emergency Call Bloc', () {
    group('Given User Try To Fetch Emergency Call,', () {
      when(callRepository.getEmergencyCallList())
          .thenAnswer((_) => Stream.fromIterable([]));

      blocTest("When Success, should emits [Success]",
          build: () => CallBloc(callRepository: callRepository),
          act: (CallBloc bloc) => bloc.add((EmergencyCallFetching())),
          expect: () => [
                CallLoading(),
              ],
          verify: (_) {
            verify(callRepository.getEmergencyCallList()).called(1);
          });
    });
  });
}
