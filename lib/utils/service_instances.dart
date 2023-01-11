import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/services/services.dart';

// TODO: might provide services globally as well

final UserService userService = UserService(
  firestore: FirebaseFirestore.instance,
);

final ProductService productService = ProductService(
  firestore: FirebaseFirestore.instance,
);

final CartService cartService = CartService(
  firestore: FirebaseFirestore.instance,
  productService: productService,
);
