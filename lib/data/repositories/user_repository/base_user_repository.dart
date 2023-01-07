import '../../models/models.dart';

abstract class BaseUserRepository {
  Stream<User> fetchUser({required String userId});

  Future<void> updateShipAddress({
    required String userId,
    required String shipAddress,
  });
}
