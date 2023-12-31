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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBrIuz83fJVZxQMatrRIP1CVYv4n1Lmbzs',
    appId: '1:811004296008:android:994301678298222141517d',
    messagingSenderId: '811004296008',
    projectId: 'flutter-video-call-chat',
    storageBucket: 'flutter-video-call-chat.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB9NxsJYYekvou7-iRO7JFRk3XJklFBsaE',
    appId: '1:811004296008:ios:e8fb939395d47fb641517d',
    messagingSenderId: '811004296008',
    projectId: 'flutter-video-call-chat',
    storageBucket: 'flutter-video-call-chat.appspot.com',
    androidClientId: '811004296008-7m2lq2c9k4mjgf3vc3dnf84bllsmhujt.apps.googleusercontent.com',
    iosClientId: '811004296008-bhs1bgrupoiod94sg4salpqjc3kv57de.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatVideoCall',
  );
}
