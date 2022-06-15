// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:kaltim_report/modules/auth/blocs/login/login_bloc.dart';
// import 'package:kaltim_report/modules/auth/providers/login_provider.dart';
// import 'package:kaltim_report/modules/auth/repositories/login_repository.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'auth_test.mocks.dart';

// @GenerateMocks([LoginProvider, LoginBloc, LoginRepository])
// void main() {
//   final MockLoginProvider loginProvider = MockLoginProvider();
//   final LoginRepository loginRepository = LoginRepository(loginProvider);

//   group('Test Login Bloc', () {
//     group('Given User Try To Login', () {
//       when(loginRepository.logInWithEmailAndPassword(
//               "tegar.yas26@gmail.com", "test123"))
//           .thenAnswer((_) => Future.value());

//       blocTest(
//         "When Success, should emits [Success]",
//         build: () =>
//            LoginBloc(loginRepository: loginRepository, authRepository: authRepository, registerRepository: registerRepository, firebaseCrashlytics: firebaseCrashlytics),
//       );
//     });
//   });
// }
