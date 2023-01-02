import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

abstract class BaseAuthRepository {
  Stream<fb_auth.User?> get user;

  Future<void> signinWithEmail({
    required String email,
    required String password,
  });

  Future<void> signupWithEmail({
    required String name,
    required String email,
    required String password,
    required String shipAddress,
  });

  Future<void> signinWithGoogle();

  Future<void> forgetPassword({required String email});

  void signout();
}
