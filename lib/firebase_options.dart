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
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAzEv0bMdsCjqf02lOsLsRJ6AyF4AJ1UZo',
    appId: '1:418108928557:web:4c99cf2b31951e631d3ea4',
    messagingSenderId: '418108928557',
    projectId: 'ucskincare-a65d0',
    authDomain: 'ucskincare-a65d0.firebaseapp.com',
    storageBucket: 'ucskincare-a65d0.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBGmt9v871_Z3bIzPYEO7_MFbeUehlPAgM',
    appId: '1:418108928557:android:609dee990df769b21d3ea4',
    messagingSenderId: '418108928557',
    projectId: 'ucskincare-a65d0',
    storageBucket: 'ucskincare-a65d0.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAK7sD-r_4U35l7ZsdkRzIni2D38exhMi4',
    appId: '1:418108928557:ios:19e9b4637f25411b1d3ea4',
    messagingSenderId: '418108928557',
    projectId: 'ucskincare-a65d0',
    storageBucket: 'ucskincare-a65d0.firebasestorage.app',
    iosBundleId: 'com.example.featureBased',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAK7sD-r_4U35l7ZsdkRzIni2D38exhMi4',
    appId: '1:418108928557:ios:19e9b4637f25411b1d3ea4',
    messagingSenderId: '418108928557',
    projectId: 'ucskincare-a65d0',
    storageBucket: 'ucskincare-a65d0.firebasestorage.app',
    iosBundleId: 'com.example.featureBased',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAzEv0bMdsCjqf02lOsLsRJ6AyF4AJ1UZo',
    appId: '1:418108928557:web:9cad5d520bf0eee91d3ea4',
    messagingSenderId: '418108928557',
    projectId: 'ucskincare-a65d0',
    authDomain: 'ucskincare-a65d0.firebaseapp.com',
    storageBucket: 'ucskincare-a65d0.firebasestorage.app',
  );
}
