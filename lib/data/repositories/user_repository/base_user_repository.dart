import '../../models/models.dart';

abstract class BaseUserRepository {
  Future<User> fetchUser({required String userId});

  Future<void> updateShipAddress({
    required String userId,
    required String shipAddress,
  });
}
