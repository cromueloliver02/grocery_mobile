import '../../models/models.dart';

abstract class BaseUserRepository {
  Future<User> fetchUser({required String id});
}
