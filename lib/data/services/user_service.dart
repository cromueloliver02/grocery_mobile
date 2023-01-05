import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/models/models.dart';
import '../../utils/utils.dart';

class UserService {
  final FirebaseFirestore firestore;

  UserService({
    required this.firestore,
  });

  Stream<DocumentSnapshot> fetchUser({required String id}) {
    try {
      return firestore.collection(kUsersCollectionPath).doc(id).snapshots();
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
      await firestore
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
