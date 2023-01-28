import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/services/services.dart';
import '../../../data/models/models.dart';
import '../../../utils/utils.dart';

import 'base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final UserService userService;
  final ProductService productService;

  UserRepository({
    required this.userService,
    required this.productService,
  });

  @override
  Stream<User> getUser(String userId) async* {
    try {
      final Stream<DocumentSnapshot> userDocStream =
          userService.getUser(userId);

      await for (final userDoc in userDocStream) {
        final wishlistItemMaps = List<Map<String, dynamic>>.from(
          (userDoc.data() as Map<String, dynamic>)['wishlist'],
        );

        final List<WishlistItem> wishlist = [];

        for (final Map<String, dynamic> wishlistItemMap in wishlistItemMaps) {
          final String productId = wishlistItemMap[kProduct];

          final DocumentSnapshot productDoc =
              await productService.getProduct(productId);

          if (productDoc.exists) {
            final Product product = Product.fromDoc(productDoc);

            final WishlistItem wishlistItem =
                WishlistItem.fromMap(wishlistItemMap, product: product);

            wishlist.insert(0, wishlistItem);
          }
        }

        final User user = User.fromDoc(userDoc, wishlist: wishlist);

        yield user;
      }
    } catch (err) {
      rethrow;
    }
  }

  @override
  Future<void> updateShipAddress({
    required String userId,
    required String shipAddress,
  }) async {
    try {
      await userService.updateShipAddress(
        userId: userId,
        shipAddress: shipAddress,
      );
    } catch (err) {
      rethrow;
    }
  }
}
