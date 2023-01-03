import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/models.dart';
import '../../utils/utils.dart';

class UserService {
  final FirebaseFirestore firebaseFirestore;

  UserService({
    required this.firebaseFirestore,
  });

  Stream<DocumentSnapshot> fetchUser({required String id}) {
    try {
      return firebaseFirestore
          .collection(kUsersCollectionPath)
          .doc(id)
          .snapshots();
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
    required String id,
    required String shipAddress,
  }) async {
    try {
      await firebaseFirestore
          .collection(kUsersCollectionPath)
          .doc(id)
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
