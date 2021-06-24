import 'package:flutter/material.dart';
import 'package:plands_v1/Home.dart';
import 'dart:async';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> 
  with SingleTickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    sizeAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );
    startSplashScreen();
  }

  startSplashScreen() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return Home();
        }),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 194, 194, 1),
      body: Center(
        child: ScaleTransition(
          scale: sizeAnimation,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              "asset/logo.png",
              width: 400,
              height: 400,
            ),
          )
        ),
      ),
    );
  }
}