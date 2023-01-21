import '../../models/models.dart';

abstract class BaseUserRepository {
  Future<User> getUser({required String userId});

  Future<void> updateShipAddress({
    required String userId,
    required String shipAddress,
  });
}
