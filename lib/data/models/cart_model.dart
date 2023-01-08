import './models.dart';

class Cart {
  final String userId;
  final List<CartItem> cartItems;

  Cart({
    required this.userId,
    required this.cartItems,
  });

  double get grandTotalPrice {
    return cartItems.fold(0, (prev, d) => prev + d.totalPrice);
  }

  bool inCart(String productId) {
    return cartItems.any((d) => d.product.id == productId);
  }

  static Cart dummyCart = Cart(
    userId: 'unique-user-id',
    cartItems: CartItem.dummyCartItems,
  );
}
