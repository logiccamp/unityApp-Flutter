import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unitycargo/app/login.dart';
import 'package:unitycargo/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: blueColor,
      child: Center(
        child: Image.asset(
          "assets/images/logo1.png",
          height: MediaQuery.of(context).size.height * 0.3,
        ),
      ),
    );
  }
}
