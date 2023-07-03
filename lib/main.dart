import 'package:flutter/material.dart';
import 'package:paycom_app/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // title: 'Flutter D?emo',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
