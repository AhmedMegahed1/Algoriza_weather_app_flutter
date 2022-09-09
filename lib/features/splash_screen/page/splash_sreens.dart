import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/feature2/home/pages/home.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/lotties/weather_splash.png',
      ),
      logoWidth: 100,
      title: const Text(
        'Welcome',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      loaderColor: Colors.white,
      backgroundColor: const Color.fromARGB(255, 20, 3, 95),
      showLoader: true,
      loadingText: const Text(
        '                          Loading...\n Copyright © 2022 Ahmed Megahed.\n                   All rights reserved. ',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      navigator: HomePage(),
      durationInSeconds: 4,
    );
  }
}
