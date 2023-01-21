import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

import './services.dart';
import '../models/models.dart';
import '../../utils/utils.dart';

class CartService {
  final FirebaseFirestore firestore;
  final ProductService productService;

  CartService({
    required this.firestore,
    required this.productService,
  });

  Future<DocumentSnapshot> getCart(String userId) async {
    try {
      // the id of cart is the same as the user id
      final DocumentSnapshot cartDoc =
          await firestore.collection(kCartsCollectionPath).doc(userId).get();

      if (!cartDoc.exists) {
        throw GCRError.exception('Cart does not exist');
      }

      return cartDoc;
    } on GCRError {
      rethrow;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> createCart(Cart cart) async {
    try {
      await firestore
          .collection(kCartsCollectionPath)
          .doc(cart.userId)
          .set(cart.toMap());
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
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

      final DocumentSnapshot cartDoc = await getCart(userId);

      final Map<String, dynamic>? existingCartItemMap =
          List<Map<String, dynamic>>.from(cartDoc.get(kCartItems))
              .firstWhereOrNull((d) => d[kProduct] == cartItem.product.id);

      // cart item does not exist in the cart, add cart item into the cart
      if (existingCartItemMap == null) {
        await cartRef.update({
          kCartItems: FieldValue.arrayUnion([cartItem.toMap()]),
        });

        return cartItem;
      }

      // there's no cleaner way to update quantity of cart item as of
      // Flutterfire Cloud Firestore version 4.3.1 (January 2023) so I
      // manually used the remove and replace method instead
      // reference: https://firebase.google.com/support/releases#firestore-index-name-sort

      // else if cart item already exist, increment quantity instead
      final String productId = existingCartItemMap[kProduct];

      final DocumentSnapshot productDoc =
          await productService.getProduct(productId);

      final CartItem existingCartItem = CartItem.fromMap(
        existingCartItemMap,
        product: Product.fromDoc(productDoc),
      );

      // remove existing cart item
      await cartRef.update({
        kCartItems: FieldValue.arrayRemove([existingCartItem.toMap()]),
      });

      final CartItem updatedCartItem = existingCartItem.copyWith(
        quantity: () => existingCartItem.quantity + 1,
      );

      // replace removed existing cart item but with an increased quantity
      await cartRef.update({
        kCartItems: FieldValue.arrayUnion([
          updatedCartItem.toMap(),
        ])
      });

      return updatedCartItem;
    } on GCRError {
      rethrow;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> removeFromCart({
    required String userId,
    required String cartItemId,
  }) async {
    try {
      // the id of cart is the same as the user id
      final DocumentReference cartRef =
          firestore.collection(kCartsCollectionPath).doc(userId);

      final DocumentSnapshot cartDoc = await getCart(userId);

      final Map<String, dynamic> cartItemMap =
          List<Map<String, dynamic>>.from(cartDoc.get(kCartItems))
              .firstWhere((d) => d[kId] == cartItemId);

      await cartRef.update({
        kCartItems: FieldValue.arrayRemove([cartItemMap]),
      });
    } on GCRError {
      rethrow;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> changeCartItemQty({
    required String userId,
    required String cartItemId,
    required CartItemQtyAction action,
  }) async {
    try {
      // the id of cart is the same as the user id
      final DocumentReference cartRef =
          firestore.collection(kCartsCollectionPath).doc(userId);
      final DocumentSnapshot cartDoc = await getCart(userId);

      final cartItemMaps =
          List<Map<String, dynamic>>.from(cartDoc.get(kCartItems));

      Map<String, dynamic> cartItemMap =
          cartItemMaps.firstWhere((d) => d[kId] == cartItemId);

      await cartRef.update({
        kCartItems: FieldValue.arrayRemove([cartItemMap]),
      });

      if (action == CartItemQtyAction.increment) {
        cartItemMap[kQuantity] = cartItemMap[kQuantity] + 1;
      } else {
        cartItemMap[kQuantity] = cartItemMap[kQuantity] - 1;
      }

      await cartRef.update({
        kCartItems: FieldValue.arrayUnion([cartItemMap])
      });
    } on GCRError {
      rethrow;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> updateCartItemQty({
    required String userId,
    required String cartItemId,
    required int newQuantity,
  }) async {
    try {
      // the id of cart is the same as the user id
      final DocumentReference cartRef =
          firestore.collection(kCartsCollectionPath).doc(userId);

      final DocumentSnapshot cartDoc = await cartRef.get();

      final cartItemMaps =
          List<Map<String, dynamic>>.from(cartDoc.get(kCartItems));

      Map<String, dynamic> cartItemMap =
          cartItemMaps.firstWhere((d) => d[kId] == cartItemId);

      await cartRef.update({
        kCartItems: FieldValue.arrayRemove([cartItemMap]),
      });

      cartItemMap[kQuantity] = newQuantity;

      await cartRef.update({
        kCartItems: FieldValue.arrayUnion([cartItemMap])
      });
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> clearCart(String userId) async {
    try {
      // the id of cart is the same as the user id
      final DocumentReference cartRef =
          firestore.collection(kCartsCollectionPath).doc(userId);

      await cartRef.update({kCartItems: []});
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }
}
