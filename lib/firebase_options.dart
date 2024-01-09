import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dartz
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform { return web; }
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDhjRDDpFXB_cBSNxuPjRoN_frrYRZE334',
    appId: '1:680472686977:web:af632211e99dcc9046b880',
    messagingSenderId: '680472686977',
    projectId: 'drawing-on-demand',
    authDomain: 'drawing-on-demand.firebaseapp.com',
    storageBucket: 'drawing-on-demand.appspot.com',
    measurementId: 'G-EESB90S8T4',
  );
  }
