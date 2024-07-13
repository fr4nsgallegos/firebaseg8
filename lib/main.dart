import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseg8/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAJW-KRgnAEapae3MFXs7no08uecvJ1Lk8",
        appId: "1:972910265079:android:f2895a27df6b34858c49f2",
        messagingSenderId: "972910265079",
        projectId: "fir-app-1cc1c"),
  );
  runApp(
    MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
