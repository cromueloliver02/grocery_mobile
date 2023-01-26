import 'package:cloud_firestore/cloud_firestore.dart';

import './models.dart';

class Cart {
  final String userId;
  final List<CartItem> cartItems;
  final DateTime createdAt;

  Cart({
    required this.userId,
    required this.cartItems,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Cart.initial() {
    return Cart(
      userId: '',
      cartItems: <CartItem>[],
    );
  }

  double get grandTotalPrice {
    return cartItems.fold(0, (prev, d) => prev + d.totalPrice);
  }

  bool inCart(String productId) {
    return cartItems.any((d) => d.product.id == productId);
  }

  @override
  String toString() =>
      'Cart(userId: $userId, cartItems: $cartItems, createdAt: $createdAt)';

  Cart copyWith({
    String Function()? userId,
    List<CartItem> Function()? cartItems,
    DateTime Function()? createdAt,
  }) {
    return Cart(
      userId: userId != null ? userId() : this.userId,
      cartItems: cartItems != null ? cartItems() : this.cartItems,
      createdAt: createdAt != null ? createdAt() : this.createdAt,
    );
  }

  Map<String, dynamic> toMap({bool populateCartItems = false}) {
    final result = <String, dynamic>{};

    final Object cartItemsField = cartItems.map((CartItem d) {
      if (!populateCartItems) return d.id;

      return d.toMap();
    }).toList();

    result.addAll({'userId': userId});
    result.addAll({'cartItems': cartItemsField});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});

    return result;
  }

  factory Cart.fromDoc(
    DocumentSnapshot doc, {
    required List<CartItem> cartItems,
  }) {
    final map = doc.data() as Map<String, dynamic>;

    return Cart(
      userId: doc.id, // id of cart document is the same as the userId
      cartItems: cartItems,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  static Cart dummyCart = Cart(
    userId: 'unique-user-id',
    cartItems: CartItem.dummyCartItems,
    createdAt: DateTime.now(),
  );
}
