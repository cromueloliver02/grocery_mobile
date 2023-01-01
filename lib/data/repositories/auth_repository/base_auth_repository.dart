abstract class BaseAuthRepository {
  Future<void> signupWithEmail({
    required String name,
    required String email,
    required String password,
    required String shipAddress,
  });
}
