import 'package:kaltim_report/modules/auth/models/register_model.dart';

abstract class RegisterProviderInterface {
  Future<void> registerWithEmailAndPassword(String email, String password);

  Future<void> registerUserData(RegisterModel data);

  Future<List<String>> checkEmailExsist(String email);

  Future<void> resetPassword(String email);
}
