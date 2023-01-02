import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

import '../../data/models/models.dart';
import '../../utils/utils.dart';

class AuthService {
  final fb_auth.FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AuthService({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  Stream<fb_auth.User?> get user => firebaseAuth.userChanges();

  Future<void> signinWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
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
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final fb_auth.User user = userCredential.user!;

      final Map<String, String> payload = {
        'name': name,
        'email': email,
        'shipAddress': shipAddress,
      };

      await firebaseFirestore
          .collection(kUserCollectionPath)
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

  void signout() => firebaseAuth.signOut();
}
