import '../../services/auth_service.dart';
import './base_auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  final AuthService authService;

  AuthRepository({
    required this.authService,
  });

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
}
