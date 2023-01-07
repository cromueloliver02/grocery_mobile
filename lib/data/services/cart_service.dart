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

  Future<CartItem> addToCart(CartItem cartItem) async {
    try {
      final DocumentReference cartItemRef = await firestore
          .collection(kCartItemsCollectionPath)
          .add(cartItem.toMap());

      final DocumentSnapshot cartItemDoc = await cartItemRef.get();

      final String productId =
          (cartItemDoc.data() as Map<String, dynamic>)['product'];

      final DocumentReference productRef =
          firestore.collection(kProductsCollectionPath).doc(productId);

      final DocumentSnapshot productDoc = await productRef.get();
      final Product product = Product.fromDoc(productDoc);

      final CartItem newCartItem = CartItem.fromDoc(
        cartItemDoc,
        product: product,
      );

      return newCartItem;
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
