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
        return macos;
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
    apiKey: 'AIzaSyD7bmGvg0gm59vBrqjppFIIh9nyj5Kl-Lc',
    appId: '1:128432159681:web:9f7b17c817cbd40f1d8d40',
    messagingSenderId: '128432159681',
    projectId: 'auth-8211a',
    authDomain: 'auth-8211a.firebaseapp.com',
    storageBucket: 'auth-8211a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAZb46J9bB_13vZVJhTqH7ILg_b75iGdh8',
    appId: '1:128432159681:android:11a5ec329a50f4ec1d8d40',
    messagingSenderId: '128432159681',
    projectId: 'auth-8211a',
    storageBucket: 'auth-8211a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCS7xALl3_Q0MgnzBoyS5ZGDgg73TdcjTg',
    appId: '1:128432159681:ios:71ac9fc90241cb261d8d40',
    messagingSenderId: '128432159681',
    projectId: 'auth-8211a',
    storageBucket: 'auth-8211a.appspot.com',
    iosBundleId: 'com.example.dc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCS7xALl3_Q0MgnzBoyS5ZGDgg73TdcjTg',
    appId: '1:128432159681:ios:a9cfbfde3277260b1d8d40',
    messagingSenderId: '128432159681',
    projectId: 'auth-8211a',
    storageBucket: 'auth-8211a.appspot.com',
    iosBundleId: 'com.example.dc.RunnerTests',
  );
}
