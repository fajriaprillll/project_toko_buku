import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_screen.dart';
import 'firebase_options.dart'; // Import the file where FirebaseOptions are defined.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase with FirebaseOptions for your platform.
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions.currentPlatform, // Use the generated options
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toko Buku Online',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
