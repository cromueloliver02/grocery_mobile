import 'dart:async';

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

  Stream<fb_auth.User?> get user {
    try {
      return fireAuth.userChanges();
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> signinWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await fireAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // when signing in using email & password, the authentication
      // process is almost instantaneous so I have to add a slight
      // delay to give time to listen to SigninStatus changes before
      // going to loading page
      return Future.delayed(const Duration(milliseconds: 500));
    } on FirebaseException catch (err) {
      if (err.code == kUserNotFound || err.code == kWrongPassword) {
        throw const GCRError(
          code: 'Incorrect credentials',
          message: 'Wrong email or password',
          plugin: 'firebase_auth',
        );
      }

      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
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

      await Future.wait([
        userService.createUser(newUser),
        cartService.createCart(cart),
      ]);
    } on GCRError {
      rethrow;
    } on FirebaseException catch (err) {
      if (err.code == kEmailAlreadyInUse) {
        throw const GCRError(
          code: 'Email Already Exist',
          message: 'Email is already taken, please try a different one.',
          plugin: 'firebase-auth',
        );
      }

      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> signinWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final fb_auth.OAuthCredential credential =
          fb_auth.GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final fb_auth.UserCredential userCredential =
          await fireAuth.signInWithCredential(credential);

      if (!userCredential.additionalUserInfo!.isNewUser) {
        // when signing in using google sign in and email
        // already exist, the authentication process is almost
        // instantaneous so I have to add a slight delay to
        // give time to listen to SigninStatus changes before
        // going to loading page
        return Future.delayed(const Duration(milliseconds: 500));
      }

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

      await Future.wait([
        userService.createUser(newUser),
        cartService.createCart(cart),
      ]);
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  Future<void> forgetPassword({required String email}) async {
    try {
      await fireAuth.sendPasswordResetEmail(email: email);
    } on FirebaseException catch (err) {
      throw GCRError.firebaseException(err);
    } catch (err) {
      throw GCRError.exception(err);
    }
  }

  void signout() {
    fireAuth.signOut();
    googleSignIn.signOut();
  }
}
