import 'package:firebase_auth/firebase_auth.dart';

import '../../services/auth_service.dart';
import './base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final AuthService authService;

  AuthRepository({
    required this.authService,
  });

  @override
  Stream<User?> get user => authService.user;

  @override
  Future<void> signupWithEmail({
    required String name,
    required String email,
    required String password,
    required String shipAddress,
  }) async {
    await authService.signupWithEmail(
      name: name,
      email: email,
      password: password,
      shipAddress: shipAddress,
    );
  }

  @override
  void signout() => authService.signout();
}
