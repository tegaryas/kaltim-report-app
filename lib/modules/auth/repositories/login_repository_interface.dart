abstract class LoginRepositoryInterface {
  Future<void> logInWithEmailAndPassword(String email, String password);
}
