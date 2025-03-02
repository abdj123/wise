import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB0R6LkTLXWG6GJ5jzWTCz_gSx0IjHnT2A",
            authDomain: "c-w-s-development-3s575q.firebaseapp.com",
            projectId: "c-w-s-development-3s575q",
            storageBucket: "c-w-s-development-3s575q.appspot.com",
            messagingSenderId: "606079748824",
            appId: "1:606079748824:web:474edee233f56ec9e065ad",
            measurementId: "G-D1X3FRDRLY"));
  } else {
    await Firebase.initializeApp();
  }
}
