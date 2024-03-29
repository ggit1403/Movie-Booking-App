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
    apiKey: 'AIzaSyC4-R-P0PKGEGdyJpXO_VeHfjSEZfFdhyo',
    appId: '1:322907176629:web:2d574debef1b543190c8fc',
    messagingSenderId: '322907176629',
    projectId: 'bookingticketapp-b151c',
    authDomain: 'bookingticketapp-b151c.firebaseapp.com',
    storageBucket: 'bookingticketapp-b151c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDyMkaTHE4wZ-chm3AmRT8xD4VNdZ_JE4g',
    appId: '1:322907176629:android:45237022d191d55790c8fc',
    messagingSenderId: '322907176629',
    projectId: 'bookingticketapp-b151c',
    storageBucket: 'bookingticketapp-b151c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBCNKgHvZTaZYSwZuYfZQOCnpCdlnoYjYc',
    appId: '1:322907176629:ios:0163af49f732faba90c8fc',
    messagingSenderId: '322907176629',
    projectId: 'bookingticketapp-b151c',
    storageBucket: 'bookingticketapp-b151c.appspot.com',
    iosClientId: '322907176629-en0rsjj35209p1p8hbh49lbjtftmkcal.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieBookingApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBCNKgHvZTaZYSwZuYfZQOCnpCdlnoYjYc',
    appId: '1:322907176629:ios:4430a5db233f052190c8fc',
    messagingSenderId: '322907176629',
    projectId: 'bookingticketapp-b151c',
    storageBucket: 'bookingticketapp-b151c.appspot.com',
    iosClientId: '322907176629-rpbvqq13d70cqcbr6f8l7fto93edmkn4.apps.googleusercontent.com',
    iosBundleId: 'com.example.movieBookingApp.RunnerTests',
  );
}
