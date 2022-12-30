import './models.dart';

class Wishlist {
  final List<Product> wishlistItems;

  Wishlist({
    required this.wishlistItems,
  });

  bool inWishlist(String productId) {
    return wishlistItems.any((d) => d.id == productId);
  }
}
