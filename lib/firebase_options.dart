// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyALkbwMPT_ZjaaHJUXfqjPF6hyLAYXyt40',
    appId: '1:889794234154:web:2c2047827a70648fe00053',
    messagingSenderId: '889794234154',
    projectId: 'grocery-app-02',
    authDomain: 'grocery-app-02.firebaseapp.com',
    storageBucket: 'grocery-app-02.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeHmMnB20yKh3Gwss59F2MklFjf-xWWfo',
    appId: '1:889794234154:android:c708e73dd95d6789e00053',
    messagingSenderId: '889794234154',
    projectId: 'grocery-app-02',
    storageBucket: 'grocery-app-02.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDoybJZ1uD3ereU8CIEUAM9TKTW5hCrDBo',
    appId: '1:889794234154:ios:42724a6e4c3f025fe00053',
    messagingSenderId: '889794234154',
    projectId: 'grocery-app-02',
    storageBucket: 'grocery-app-02.appspot.com',
    iosClientId: '889794234154-djblsot2pv8k9fv85n335u8tq813rkkc.apps.googleusercontent.com',
    iosBundleId: 'com.example.groceryMobile',
  );
}
