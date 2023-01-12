import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import './product_service.dart';
import '../models/models.dart';
import '../../utils/utils.dart';

class CartService {
  final FirebaseFirestore firestore;
  final ProductService productService;

  CartService({
    required this.firestore,
    required this.productService,
  });

  Future<DocumentSnapshot> getCartByUserId(String userId) async {
    try {
      final DocumentSnapshot cartDoc =
          await firestore.collection(kCartsCollectionPath).doc(userId).get();

      return cartDoc;
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

  Future<void> createCart(Cart cart) async {
    try {
      await firestore
          .collection(kCartsCollectionPath)
          .doc(cart.userId)
          .set(cart.toMap());
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

  Future<DocumentSnapshot> getCart(String userId) async {
    try {
      // the id of cart is the same as the user id
      final DocumentSnapshot cartDoc = await getCartByUserId(userId);

      return cartDoc;
    } on FirebaseException catch (err) {
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } on GCRError {
      rethrow;
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<CartItem> addToCart({
    required String userId,
    required CartItem cartItem,
  }) async {
    try {
      // the id of cart is the same as the user id
      final DocumentReference cartRef =
          firestore.collection(kCartsCollectionPath).doc(userId);

      final DocumentSnapshot cartDoc = await getCartByUserId(userId);

      final Map<String, dynamic>? existingCartItemMap =
          List<Map<String, dynamic>>.from(cartDoc.get('cartItems'))
              .firstWhereOrNull((d) => d['product'] == cartItem.product.id);

      // cart item does not exist in the cart, add cart item into the cart
      if (existingCartItemMap == null) {
        await cartRef.update({
          'cartItems': FieldValue.arrayUnion([cartItem.toMap()]),
        });

        return cartItem;
      }

      // there's no cleaner way to update quantity of cart item as of
      // Flutterfire Cloud Firestore version 4.3.1 (January 2023) so I
      // manually used the remove and replace method instead
      // reference: https://firebase.google.com/support/releases#firestore-index-name-sort

      // else if cart item already exist, increment quantity instead
      final String productId = existingCartItemMap['product'];

      final DocumentSnapshot productDoc =
          await productService.getProduct(productId);

      CartItem existingCartItem = CartItem.fromMap(
        existingCartItemMap,
        product: Product.fromDoc(productDoc),
      );

      // remove existing cart item
      await cartRef.update({
        'cartItems': FieldValue.arrayRemove([existingCartItem.toMap()]),
      });

      final CartItem updatedCartItem = existingCartItem.copyWith(
          quantity: () => existingCartItem.quantity + 1);

      // replace removed existing cart item but with an increased quantity
      await cartRef.update({
        'cartItems': FieldValue.arrayUnion([
          updatedCartItem.toMap(),
        ])
      });

      return updatedCartItem;
    } on FirebaseException catch (err) {
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } on GCRError {
      rethrow;
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
