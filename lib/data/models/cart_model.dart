import 'package:cloud_firestore/cloud_firestore.dart';

import './models.dart';

class Cart {
  final String id; // id is the same as the user id
  final List<CartItem> cartItems;
  final DateTime createdAt;

  Cart({
    required this.id,
    required this.cartItems,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  factory Cart.initial() {
    return Cart(
      id: '',
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
      'Cart(id: $id, cartItems: $cartItems, createdAt: $createdAt)';

  Cart copyWith({
    String Function()? id,
    List<CartItem> Function()? cartItems,
    DateTime Function()? createdAt,
  }) {
    return Cart(
      id: id != null ? id() : this.id,
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

    result.addAll({'id': id});
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
      id: doc.id, // id of cart document is the same as the id
      cartItems: cartItems,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  static Cart dummyCart = Cart(
    id: 'unique-user-id',
    cartItems: CartItem.dummyCartItems,
    createdAt: DateTime.now(),
  );
}
