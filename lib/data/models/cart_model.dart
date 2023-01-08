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

  double get grandTotalPrice {
    return cartItems.fold(0, (prev, d) => prev + d.totalPrice);
  }

  bool inCart(String productId) {
    return cartItems.any((d) => d.product.id == productId);
  }

  Cart copyWith({
    String? userId,
    List<CartItem>? cartItems,
    DateTime? createdAt,
  }) {
    return Cart(
      userId: userId ?? this.userId,
      cartItems: cartItems ?? this.cartItems,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'userId': userId});
    result.addAll({'cartItems': cartItems.map((d) => d.id).toList()});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});

    return result;
  }

  static Cart dummyCart = Cart(
    userId: 'unique-user-id',
    cartItems: CartItem.dummyCartItems,
    createdAt: DateTime.now(),
  );
}
