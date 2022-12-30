import './models.dart';

class Cart {
  final List<CartItem> cartItems;

  Cart({
    required this.cartItems,
  });

  double get grandTotalPrice {
    return cartItems.fold(0, (prev, d) => prev + d.totalPrice);
  }

  bool inCart(String productId) {
    return cartItems.any((d) => d.product.id == productId);
  }
}
