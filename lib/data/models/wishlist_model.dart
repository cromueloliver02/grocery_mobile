import './models.dart';

class Wishlist {
  final List<WishlistItem> wishlistItems;

  Wishlist({
    required this.wishlistItems,
  });

  bool inWishlist(String productId) {
    return wishlistItems.any((d) => d.product.id == productId);
  }

  Wishlist copyWith({
    List<WishlistItem> Function()? wishlistItems,
  }) {
    return Wishlist(
      wishlistItems:
          wishlistItems != null ? wishlistItems() : this.wishlistItems,
    );
  }
}
