import 'package:cloud_firestore/cloud_firestore.dart';

import './services.dart';
import '../models/models.dart';
import '../../utils/utils.dart';

class CartService {
  final FirebaseFirestore firestore;
  final ProductService productService;

  const CartService({
    required this.firestore,
    required this.productService,
  });

  Stream<DocumentSnapshot> getCart(String userId) {
    try {
      final Stream<DocumentSnapshot> cartDocStream = firestore
          .collection(kCartsCollectionPath)
          .doc(userId) // the id of cart is the same as the user id
          .snapshots();

      return cartDocStream;
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
          .doc(cart.id) // the id of cart is the same as the user id
          .set(cart.toMap());
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> addToCart({
    required String userId,
    required List<CartItem> newCartItems,
  }) async {
    try {
      final List<Map<String, dynamic>> newCartItemMaps =
          newCartItems.map((CartItem d) => d.toMap()).toList();

      await firestore
          .collection(kCartsCollectionPath)
          .doc(userId) // the id of cart is the same as the user id
          .update({kCartItems: newCartItemMaps});
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> removeFromCart({
    required String userId,
    required List<CartItem> newCartItems,
  }) async {
    try {
      final List<Map<String, dynamic>> newCartItemMaps =
          newCartItems.map((CartItem d) => d.toMap()).toList();

      await firestore
          .collection(kCartsCollectionPath)
          .doc(userId) // the id of cart is the same as the user id
          .update({kCartItems: newCartItemMaps});
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> incrementCartItemQty({
    required String userId,
    required List<CartItem> newCartItems,
  }) async {
    try {
      final List<Map<String, dynamic>> newCartItemMaps =
          newCartItems.map((CartItem d) => d.toMap()).toList();

      await firestore
          .collection(kCartsCollectionPath)
          .doc(userId) // the id of cart is the same as the user id
          .update({kCartItems: newCartItemMaps});
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> decrementCartItemQty({
    required String userId,
    required List<CartItem> newCartItems,
  }) async {
    try {
      final List<Map<String, dynamic>> newCartItemMaps =
          newCartItems.map((CartItem d) => d.toMap()).toList();

      await firestore
          .collection(kCartsCollectionPath)
          .doc(userId) // the id of cart is the same as the user id
          .update({kCartItems: newCartItemMaps});
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> updateCartItemQty({
    required String userId,
    required List<CartItem> newCartItems,
  }) async {
    try {
      final List<Map<String, dynamic>> newCartItemMaps =
          newCartItems.map((CartItem d) => d.toMap()).toList();

      await firestore
          .collection(kCartsCollectionPath)
          .doc(userId) // the id of cart is the same as the user id
          .update({kCartItems: newCartItemMaps});
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> clearCart(String userId) async {
    try {
      await firestore
          .collection(kCartsCollectionPath)
          .doc(userId) // the id of cart is the same as the user id
          .update({kCartItems: <CartItem>[]});
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }
}
