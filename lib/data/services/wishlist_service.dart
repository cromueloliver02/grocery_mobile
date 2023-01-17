import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../../utils/utils.dart';

class WishlistService {
  final FirebaseFirestore firestore;

  WishlistService({
    required this.firestore,
  });

  Future<void> addToWishlist({
    required String userId,
    required String productId,
  }) async {
    try {
      final DocumentReference userRef =
          firestore.collection(kUsersCollectionPath).doc(userId);

      await userRef.update({
        kWishlist: FieldValue.arrayUnion([productId]),
      });
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
