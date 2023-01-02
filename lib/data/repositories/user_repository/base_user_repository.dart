import '../../models/models.dart';

abstract class BaseUserRepository {
  Future<User> fetchUser({required String id});

  Future<void> updateShipAddress({
    required String id,
    required String shipAddress,
  });
}
