import 'package:flutter/material.dart';
import 'package:planet_app/modules/on_boarding/on_boarding_view.dart';
import 'package:planet_app/shared/style/fonts/font_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _splashFunction();
    super.initState();
  }

  void _splashFunction() async {
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) {
          return const OnBoardingView();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: Column(
        children: [
          const Spacer(flex: 1),
          Image.asset(
            'lib/asset/image/splash_screen.png',
            color: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            textAlign: TextAlign.center,
            'Plants Disease Detection',
            style: FontsClass.font20bold,
          ),
          const Text(
            textAlign: TextAlign.center,
            'Application',
            style: FontsClass.font20bold,
          ),
          const Spacer(flex: 2)
        ],
      ),
    );
  }
}
