import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../../utils/utils.dart';

class CartService {
  final FirebaseFirestore firestore;

  CartService({
    required this.firestore,
  });

  Future<void> addToCart(CartItem cartItem) async {
    try {
      await firestore
          .collection(kCartItemsCollectionPath)
          .doc()
          .set(cartItem.toMap());
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
