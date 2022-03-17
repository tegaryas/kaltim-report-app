import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/auth/providers/login_provider_interface.dart';
import 'package:kaltim_report/modules/auth/repositories/login_repository_interface.dart';

@Injectable(as: LoginRepositoryInterface)
class LoginRepository implements LoginRepositoryInterface {
  final LoginProviderInterface loginProvider;

  const LoginRepository(this.loginProvider);

  @override
  Future<void> logInWithEmailAndPassword(String email, String password) =>
      loginProvider.logInWithEmailAndPassword(email, password);

  @override
  Future<void> logInWithGoogle() => loginProvider.logInWithGoogle();

  @override
  Future<bool> isUserRegister(String email) {
    return loginProvider.isUserRegister(email);
  }
}
