import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/models.dart';
import '../../utils/utils.dart';

class UserService {
  final FirebaseFirestore firestore;

  UserService({
    required this.firestore,
  });

  Future<DocumentSnapshot> fetchUser({required String userId}) async {
    try {
      final DocumentSnapshot userDoc =
          await firestore.collection(kUsersCollectionPath).doc(userId).get();

      return userDoc;
    } on FirebaseException catch (err) {
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<void> createUser(User user) async {
    try {
      await firestore
          .collection(kUsersCollectionPath)
          .doc(user.id)
          .set(user.toMap());
    } on FirebaseException catch (err) {
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<void> updateShipAddress({
    required String userId,
    required String shipAddress,
  }) async {
    try {
      await firestore
          .collection(kUsersCollectionPath)
          .doc(userId)
          .update({'shipAddress': shipAddress});
    } on FirebaseException catch (err) {
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
