import 'package:firebase_auth/firebase_auth.dart';

import '../../services/auth_service.dart';
import './base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final AuthService authService;

  AuthRepository({
    required this.authService,
  });

  @override
  Stream<User?> get user {
    try {
      return authService.user;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> signinWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await authService.signinWithEmail(
        email: email,
        password: password,
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> signupWithEmail({
    required String name,
    required String email,
    required String password,
    required String shipAddress,
  }) async {
    try {
      await authService.signupWithEmail(
        name: name,
        email: email,
        password: password,
        shipAddress: shipAddress,
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> signinWithGoogle() async {
    try {
      await authService.signinWithGoogle();
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> forgetPassword({required String email}) async {
    try {
      await authService.forgetPassword(email);
    } catch (err) {
      rethrow;
    }
  }

  @override
  void signout() => authService.signout();
}
