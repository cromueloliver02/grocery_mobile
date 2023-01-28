import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/services/services.dart';
import '../../models/models.dart';
import '../../../utils/utils.dart';
import 'base_wishlist_repository.dart';

class WishlistRepository extends BaseWishlistRepository {
  final WishlistService wishlistService;

  WishlistRepository({
    required this.wishlistService,
  });

  @override
  Stream<Wishlist> getWishlist(String userId) async* {
    try {
      final Stream<List<Map<String, dynamic>>> wishlistItemMapsStream =
          wishlistService.fetchWishlistItems(userId);

      await for (final List<Map<String, dynamic>> wishlistItemMaps
          in wishlistItemMapsStream) {
        final List<WishlistItem> wishlistItems = [];

        for (final Map<String, dynamic> wishlistItemMap in wishlistItemMaps) {
          final String productId = wishlistItemMap[kProduct];

          final DocumentSnapshot productDoc = await FirebaseFirestore.instance
              .collection(kProductsCollectionPath)
              .doc(productId)
              .get();

          final Product product = Product.fromDoc(productDoc);

          final WishlistItem wishlistItem =
              WishlistItem.fromMap(wishlistItemMap, product: product);

          wishlistItems.insert(0, wishlistItem);
        }

        wishlistItems.sort((a, b) => b.createdAt.compareTo(a.createdAt));

        yield Wishlist(wishlistItems: wishlistItems);
      }
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> addToWishlist({
    required String userId,
    required List<WishlistItem> newWishlistItems,
  }) async {
    try {
      await wishlistService.addToWishlist(
        userId: userId,
        newWishlistItems: newWishlistItems,
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> removeFromWishlist({
    required String userId,
    required List<WishlistItem> newWishlistItems,
  }) async {
    try {
      await wishlistService.removeFromWishlist(
        userId: userId,
        newWishlistItems: newWishlistItems,
      );
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> clearWishlist(String userId) async {
    try {
      await wishlistService.clearWishlist(userId);
    } catch (err) {
      rethrow;
    }
  }
}
