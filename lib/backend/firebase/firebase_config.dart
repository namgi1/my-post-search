import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA85jQ1N4Bham5JwSa1R0sdGkg-Q7PkpGQ",
            authDomain: "hallie-5c03d.firebaseapp.com",
            projectId: "hallie-5c03d",
            storageBucket: "hallie-5c03d.firebasestorage.app",
            messagingSenderId: "298850343781",
            appId: "1:298850343781:web:55c9da696bd319d481df8c",
            measurementId: "G-BVNENZVFTE"));
  } else {
    await Firebase.initializeApp();
  }
}
