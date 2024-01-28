import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDuSVoxNRsu1E62dhRMSRhPIZCkegWqDbU",
            authDomain: "dreambrush-9ff60.firebaseapp.com",
            projectId: "dreambrush-9ff60",
            storageBucket: "dreambrush-9ff60.appspot.com",
            messagingSenderId: "396095312956",
            appId: "1:396095312956:web:2f5f80d9e1b8f154e6df39",
            measurementId: "G-ZSSP9QSQ4Y"));
  } else {
    await Firebase.initializeApp();
  }
}
