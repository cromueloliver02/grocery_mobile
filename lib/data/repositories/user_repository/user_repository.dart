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
  Future<User> fetchUser({required String id}) async {
    final DocumentSnapshot userDoc = await userService.fetchUser(id: id);

    return User.fromDoc(userDoc);
  }
}
