// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBJHgCyIfFmnV1P9gZP5z6h1FprruN3ti0',
    appId: '1:376973770101:web:0901116820bbdc733e273c',
    messagingSenderId: '376973770101',
    projectId: 'artfolio-5073f',
    authDomain: 'artfolio-5073f.firebaseapp.com',
    storageBucket: 'artfolio-5073f.appspot.com',
    measurementId: 'G-YYNHMF8NE2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDp8WuPKuLYYWTZi7XNB9k0jyd-fWwkp04',
    appId: '1:376973770101:android:5059868ec7e3b24c3e273c',
    messagingSenderId: '376973770101',
    projectId: 'artfolio-5073f',
    storageBucket: 'artfolio-5073f.appspot.com',
  );
}
