import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rating_film/home_user.dart';
import 'package:rating_film/login.dart';
import 'package:rating_film/profil.dart';
import 'package:rating_film/view/splash_screen.dart';

late final FirebaseApp app;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyAmjjVm8-sCZv-ZTVzslO8aPl2iXLgxPUw",
        appId: "1:336957278123:android:378b85e4e8bf3c3200b4ee",
        messagingSenderId: "336957278123",
        projectId: "ratingfilm-18c06"),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: SplashScreen(),
    );
  }
}
