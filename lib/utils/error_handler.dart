import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

import '../data/models/models.dart';
import './utils.dart';

void handleFirebaseException(FirebaseException err) {
  if (err.code == kUserNotFound || err.code == kWrongPassword) {
    throw const GCRError(
      code: 'Incorrect credentials',
      message: 'Wrong email or password',
      plugin: 'firebase_auth',
    );
  }

  if (err.code == kEmailAlreadyInUse) {
    throw const GCRError(
      code: 'Email Already Exist',
      message: 'Email is already taken, please try a different one.',
      plugin: 'firebase-auth',
    );
  }

  if (err.code == kNetworkRequestFailed) {
    throw GCRError(
      code: err.code,
      message: 'Please connect to the internet',
      plugin: 'flutter_error',
    );
  }

  throw GCRError.firebaseException(err);
}

void handlePlatformException(PlatformException err) {
  if (err.code == kNetworkError) {
    throw GCRError(
      code: err.code,
      message: 'Please connect to the internet',
      plugin: 'flutter_error',
    );
  }

  throw GCRError.exception(err);
}
