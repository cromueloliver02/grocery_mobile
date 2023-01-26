import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../data/services/services.dart';

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

final OrderService orderService = OrderService(
  firestore: FirebaseFirestore.instance,
);

final WishlistService wishlistService = WishlistService(
  firestore: FirebaseFirestore.instance,
);

final AuthService authService = AuthService(
  fireAuth: FirebaseAuth.instance,
  firestore: FirebaseFirestore.instance,
  googleSignIn: GoogleSignIn(),
  userService: userService,
  cartService: cartService,
);
