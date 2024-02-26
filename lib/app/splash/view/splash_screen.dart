import 'package:flutter/material.dart';


import '../../../utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextPrimaryColor.withOpacity(0.5),
      body: Column(
        children: [
        ],
      ),
    );
  }
}
