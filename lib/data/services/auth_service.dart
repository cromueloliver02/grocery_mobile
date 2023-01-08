import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/services/services.dart';
import '../../data/models/models.dart';
import '../../utils/utils.dart';

class AuthService {
  final fb_auth.FirebaseAuth fireAuth;
  final FirebaseFirestore firestore;
  final GoogleSignIn googleSignIn;
  final UserService userService;
  final CartService cartService;

  AuthService({
    required this.fireAuth,
    required this.firestore,
    required this.googleSignIn,
    required this.userService,
    required this.cartService,
  });

  Stream<fb_auth.User?> get user => fireAuth.userChanges();

  Future<void> signinWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await fireAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseException catch (err) {
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<void> signupWithEmail({
    required String name,
    required String email,
    required String password,
    required String shipAddress,
  }) async {
    try {
      final fb_auth.UserCredential userCredential =
          await fireAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final fb_auth.User user = userCredential.user!;

      final User newUser = User(
        id: user.uid,
        name: name,
        email: email,
        shipAddress: shipAddress,
        wishlist: const <Product>[],
        createdAt: DateTime.now(),
      );

      final Cart cart = Cart(
        userId: user.uid,
        cartItems: <CartItem>[],
      );

      await userService.createUser(newUser);

      await cartService.createCart(cart);
    } on FirebaseException catch (err) {
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<void> signinWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) return;

      final bool isAlreadySignedup =
          await isEmailAlreadySignedUp(googleUser.email);

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final fb_auth.OAuthCredential credential =
          fb_auth.GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final fb_auth.UserCredential userCredential =
          await fireAuth.signInWithCredential(credential);

      if (isAlreadySignedup) return;

      final fb_auth.User user = userCredential.user!;

      final User newUser = User(
        id: user.uid,
        name: user.displayName!,
        email: user.email!,
        shipAddress: null,
        wishlist: const <Product>[],
        createdAt: DateTime.now(),
      );

      final Cart cart = Cart(
        userId: user.uid,
        cartItems: <CartItem>[],
      );

      await userService.createUser(newUser);

      await cartService.createCart(cart);
    } on FirebaseException catch (err) {
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  Future<void> forgetPassword({required String email}) async {
    try {
      await fireAuth.sendPasswordResetEmail(email: email);
    } on FirebaseException catch (err) {
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }

  void signout() {
    fireAuth.signOut();
    googleSignIn.signOut();
  }

  Future<bool> isEmailAlreadySignedUp(String email) async {
    try {
      final List<String> signinMethods =
          await fireAuth.fetchSignInMethodsForEmail(email);

      return signinMethods.contains(googleSigninMethod);
    } on FirebaseException catch (err) {
      throw GCRError(
        code: err.code,
        message: err.message!,
        plugin: err.plugin,
      );
    } catch (err) {
      throw GCRError(
        code: 'Exception',
        message: err.toString(),
        plugin: 'flutter_error/server_error',
      );
    }
  }
}
