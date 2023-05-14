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
    apiKey: 'AIzaSyBZzORguruRNvIGLZgXEXEyoAdfnk3zj20',
    appId: '1:431854939442:web:811a4e55689b236f777b2b',
    messagingSenderId: '431854939442',
    projectId: 'carparking-1568a',
    authDomain: 'carparking-1568a.firebaseapp.com',
    storageBucket: 'carparking-1568a.appspot.com',
    measurementId: 'G-BWXR3MRCQF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_rvt9pkYMJP5_hg-SPB--nQHsenRzlwE',
    appId: '1:431854939442:android:2d7adbafd709b3ce777b2b',
    messagingSenderId: '431854939442',
    projectId: 'carparking-1568a',
    storageBucket: 'carparking-1568a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeLb6Ak8U-ndnNl7heLQOLvfmGrUXBZIk',
    appId: '1:431854939442:ios:dbaa5958a4e68c6d777b2b',
    messagingSenderId: '431854939442',
    projectId: 'carparking-1568a',
    storageBucket: 'carparking-1568a.appspot.com',
    iosClientId: '431854939442-fb2ki4q0jjcvu283tjehlo1jcvsohq79.apps.googleusercontent.com',
    iosBundleId: 'com.example.carparking',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCeLb6Ak8U-ndnNl7heLQOLvfmGrUXBZIk',
    appId: '1:431854939442:ios:dbaa5958a4e68c6d777b2b',
    messagingSenderId: '431854939442',
    projectId: 'carparking-1568a',
    storageBucket: 'carparking-1568a.appspot.com',
    iosClientId: '431854939442-fb2ki4q0jjcvu283tjehlo1jcvsohq79.apps.googleusercontent.com',
    iosBundleId: 'com.example.carparking',
  );
}