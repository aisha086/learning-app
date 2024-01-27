import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 7));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: AnimatedTextKit(
              isRepeatingAnimation: false,
              animatedTexts: [
                TyperAnimatedText("QuizWiz",
                  speed: const Duration(milliseconds: 100),
                  textStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 40
                  )
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/images/image3.gif',
              height: 400,
              width: 400,
            ),
          ),
          const SizedBox(height: 50,),
          Text('WELCOME',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              shadows: const [
                Shadow(
                  blurRadius: 3.0,
                  color: Colors.black,
                  offset: Offset(1.0,1.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}