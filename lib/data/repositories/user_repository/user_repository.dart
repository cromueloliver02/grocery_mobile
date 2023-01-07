import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/services/services.dart';
import '../../../data/models/models.dart';

import './base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final UserService userService;

  UserRepository({
    required this.userService,
  });

  @override
  Stream<User> fetchUser({required String userId}) {
    try {
      final Stream<DocumentSnapshot> userSnapStream =
          userService.fetchUser(userId: userId);

      return userSnapStream.map((doc) => User.fromDoc(doc));
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> updateShipAddress({
    required String userId,
    required String shipAddress,
  }) async {
    try {
      await userService.updateShipAddress(
        userId: userId,
        shipAddress: shipAddress,
      );
    } catch (err) {
      rethrow;
    }
  }
}
