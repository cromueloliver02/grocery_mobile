import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/services/services.dart';
import '../../../data/models/models.dart';

import './base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final UserService userService;
  final ProductService productService;

  UserRepository({
    required this.userService,
    required this.productService,
  });

  @override
  Future<User> fetchUser({required String userId}) async {
    try {
      final List<Product> wishlist = [];

      final DocumentSnapshot userDoc = await userService.getUser(userId);

      final List<String> productIds = List<String>.from(
        (userDoc.data() as Map<String, dynamic>)['wishlist'],
      );

      for (String productId in productIds) {
        final DocumentSnapshot productDoc =
            await productService.getProduct(productId);

        final Product product = Product.fromDoc(productDoc);

        wishlist.add(product);
      }

      final User user = User.fromDoc(userDoc, wishlist: wishlist);

      return user;
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
