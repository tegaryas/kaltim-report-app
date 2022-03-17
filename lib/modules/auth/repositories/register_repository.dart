import 'package:injectable/injectable.dart';
import 'package:kaltim_report/modules/auth/models/register_model.dart';
import 'package:kaltim_report/modules/auth/providers/register_provider_interface.dart';
import 'package:kaltim_report/modules/auth/repositories/register_repository_interface.dart';

@Injectable(as: RegisterRepositoryInterface)
class RegisterRepository implements RegisterRepositoryInterface {
  final RegisterProviderInterface registerProvider;

  const RegisterRepository(this.registerProvider);

  @override
  Future<void> registerWithEmailAndPassword(String email, String password) =>
      registerProvider.registerWithEmailAndPassword(email, password);

  @override
  Future<void> registerUserData(RegisterModel data) =>
      registerProvider.registerUserData(data);

  @override
  Future<List<String>> checkEmailExsist(String email) async {
    return registerProvider.checkEmailExsist(email);
  }

  @override
  Future<void> resetPassword(String email) =>
      registerProvider.resetPassword(email);
}
