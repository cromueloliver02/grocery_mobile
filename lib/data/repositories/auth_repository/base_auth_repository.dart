import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

abstract class BaseAuthRepository {
  Stream<fb_auth.User?> get user;

  Future<void> signupWithEmail({
    required String name,
    required String email,
    required String password,
    required String shipAddress,
  });

  void signout();
}
