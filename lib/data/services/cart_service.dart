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

  Stream<DocumentSnapshot> getCart(String userId) {
    try {
      final Stream<DocumentSnapshot> cartDocStream =
          firestore.collection(kCartsCollectionPath).doc(userId).snapshots();

      return cartDocStream;
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

  Future<void> addToCart({
    required CartItem cartItem,
    required Cart cart,
  }) async {
    try {
      final CartItem? existingCartItem = cart.cartItems.firstWhereOrNull(
        (CartItem d) => d.product.id == cartItem.product.id,
      );

      late final Cart newCart;

      if (existingCartItem != null) {
        // increment cart item's quantity
        final List<CartItem> cartItems = cart.cartItems
            .map((CartItem d) => d.product.id == cartItem.product.id
                ? d.copyWith(quantity: () => d.quantity + 1)
                : d)
            .toList();

        newCart = cart.copyWith(cartItems: () => cartItems);
      } else {
        // insert product to cart
        final List<CartItem> cartItems = [cartItem, ...cart.cartItems];

        newCart = cart.copyWith(cartItems: () => cartItems);
      }

      await firestore
          .collection(kCartsCollectionPath)
          .doc(cart.userId) // the id of cart is the same as the user id
          .set(newCart.toMap(populateCartItems: true));
    } on GCRError {
      rethrow;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> removeFromCart({
    required String cartItemId,
    required Cart cart,
  }) async {
    try {
      final Cart newCart = cart.copyWith(
        cartItems: () =>
            cart.cartItems.where((CartItem d) => d.id != cartItemId).toList(),
      );

      await firestore
          .collection(kCartsCollectionPath)
          .doc(cart.userId) // the id of cart is the same as the user id
          .set(newCart.toMap(populateCartItems: true));
    } on GCRError {
      rethrow;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> changeCartItemQty({
    required String cartItemId,
    required Cart cart,
    required CartItemQtyAction action,
  }) async {
    try {
      final List<CartItem> cartItems = cart.cartItems.map((d) {
        if (d.id != cartItemId) return d;

        if (action == CartItemQtyAction.increment) {
          return d.copyWith(quantity: () => d.quantity + 1);
        } else {
          return d.copyWith(quantity: () => d.quantity - 1);
        }
      }).toList();

      final Cart newCart = cart.copyWith(cartItems: () => cartItems);

      await firestore
          .collection(kCartsCollectionPath)
          .doc(cart.userId) // the id of cart is the same as the user id
          .set(newCart.toMap(populateCartItems: true));
    } on GCRError {
      rethrow;
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> updateCartItemQty({
    required String cartItemId,
    required Cart cart,
    required int newQuantity,
  }) async {
    try {
      final List<CartItem> cartItems = cart.cartItems
          .map((CartItem d) =>
              d.id == cartItemId ? d.copyWith(quantity: () => newQuantity) : d)
          .toList();

      final Cart newCart = cart.copyWith(cartItems: () => cartItems);

      await firestore
          .collection(kCartsCollectionPath)
          .doc(cart.userId) // the id of cart is the same as the user id
          .set(newCart.toMap(populateCartItems: true));
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> clearCart(Cart cart) async {
    try {
      final Cart newCart = cart.copyWith(cartItems: () => []);

      await firestore
          .collection(kCartsCollectionPath)
          .doc(cart.userId) // the id of cart is the same as the user id
          .set(newCart.toMap(populateCartItems: true));
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }
}
