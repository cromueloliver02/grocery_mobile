import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/models.dart';
import '../../utils/utils.dart';

class CartService {
  final FirebaseFirestore firestore;

  CartService({
    required this.firestore,
  });

  Future<QuerySnapshot> fetchCartItems(String userId) async {
    try {
      final CollectionReference cartItemsRef =
          firestore.collection(kCartItemsCollectionPath);

      final QuerySnapshot cartItemsSnapshot =
          await cartItemsRef.where('user', isEqualTo: userId).get();

      return cartItemsSnapshot;
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
