import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_clone/widgets/bottomnavbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), (){ Navigator.pushReplacement(context , MaterialPageRoute(builder: (context)=> const BottomNavBar()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Image.asset('assets/netflix.png'),
        ),
      ),
    );
  }
}