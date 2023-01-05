import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:google_sign_in/google_sign_in.dart';

import '../../data/models/models.dart';
import '../../utils/utils.dart';

class AuthService {
  final fb_auth.FirebaseAuth fireAuth;
  final FirebaseFirestore firestore;
  final GoogleSignIn googleSignIn;

  AuthService({
    required this.fireAuth,
    required this.firestore,
    required this.googleSignIn,
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

      final Map<String, dynamic> payload = {
        'id': user.uid,
        'name': name,
        'email': email,
        'shipAddress': shipAddress,
        'wishlist': <String>[],
        'createdAt': Timestamp.now(),
      };

      await firestore
          .collection(kUsersCollectionPath)
          .doc(user.uid)
          .set(payload);
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

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final fb_auth.OAuthCredential credential =
          fb_auth.GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      await fireAuth.signInWithCredential(credential);
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
}
