import 'package:challenge_tarea_one/screens/onboarding_screen.dart';
import 'package:challenge_tarea_one/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:challenge_tarea_one/screens/home_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: 'Challenge_One',
      theme: ThemeData.dark(),
      home: const SplashScreen(),
      //home: const HomePageAnimals(),
      routes: {
        "/home": (BuildContext context) => const HomePageAnimals(),
        "/onboarding": (BuildContext context) => const Onboarding() 
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
