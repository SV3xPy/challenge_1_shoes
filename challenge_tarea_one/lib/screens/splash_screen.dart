import 'package:flutter/material.dart';
import 'package:challenge_tarea_one/screens/login_page.dart';
import 'package:lottie/lottie.dart';
import 'package:splash_view/source/presentation/pages/pages.dart';
import 'package:splash_view/source/presentation/widgets/done.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SplashView(
      backgroundColor: Colors.black,
      //logo:Image.network('https://wallpapercave.com/wp/wp4667133.jpg',
      //        height: 250),
      loadingIndicator: Lottie.network(
          'https://lottie.host/cfb39a57-45bb-44d5-bbcb-2b0eaf61e571/XNQk7atm4A.json'),
      done: Done(const LoginScreen(),
          animationDuration: const Duration(milliseconds: 3000)),
    );
  }
}
