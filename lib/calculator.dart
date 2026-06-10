import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Lottie.asset("assets/splash.json"),),);
  }
}