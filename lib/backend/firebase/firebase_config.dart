import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCWHUQvbxXBSNzFtpMjbOj1qd_DecUVt-8",
            authDomain: "wgpf-53a53-2109d.firebaseapp.com",
            projectId: "wgpf-53a53",
            storageBucket: "wgpf-53a53.appspot.com",
            messagingSenderId: "9248731421",
            appId: "1:9248731421:web:801bf89ef0812fee1131f4"));
  } else {
    await Firebase.initializeApp();
  }
}
