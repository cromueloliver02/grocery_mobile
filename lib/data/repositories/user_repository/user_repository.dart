import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../data/services/services.dart';
import '../../../data/models/models.dart';

import '../../../utils/utils.dart';
import './base_user_repository.dart';

class UserRepository extends BaseUserRepository {
  final UserService userService;

  UserRepository({
    required this.userService,
  });

  @override
  Future<User> fetchUser({required String userId}) async {
    try {
      final CollectionReference productsRef =
          FirebaseFirestore.instance.collection(kProductsCollectionPath);
      final List<Product> wishlist = [];

      final DocumentSnapshot userDoc = await userService.getUser(userId);

      final List<String> productIds = List<String>.from(
        (userDoc.data() as Map<String, dynamic>)['wishlist'],
      );

      for (String productId in productIds) {
        DocumentReference productRef = productsRef.doc(productId);

        DocumentSnapshot productDoc = await productRef.get();

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
