import 'package:chatbot/utils/text.dart';
import 'package:chatbot/views/welcome_page/WelcomePageView.dart';
import 'package:flutter/material.dart';

import '../../componant/imgComponant.dart';
import '../../utils/images.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  bool _shouldNavigate = true;

  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

  @override
  void dispose() {
    _shouldNavigate = false;
    super.dispose();
  }

  void navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    if (_shouldNavigate) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const WelcomePageView()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imgComponant(width: 75, height: 75, img: splashBackground),
          Text(
            splash_1,
            style: TextStyle(
                color: Color(0xff1F222A),
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
          Text(
            splash_2,
            style: TextStyle(
                color: Color(0xff1F222A),
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontSize: 12),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: imgComponant(width: 45, height: 45, img: loading),
          )
        ],
      ),
    );
  }
}
