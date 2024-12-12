import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/screens/splash_screen.dart';

void main(){
  runApp(
    const Netflix()
  );
}

class Netflix extends StatelessWidget {
  const Netflix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Netflix',
    themeMode:ThemeMode.dark,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: const TextTheme(
        bodyLarge:TextStyle(color: Colors.white,fontSize: 24) ,
        bodyMedium: TextStyle(color: Colors.white,fontSize: 20),
      ),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.black).copyWith(surface: Colors.black),
      fontFamily:GoogleFonts.ptSans().fontFamily ,
       useMaterial3: true
    ),
    home: const SplashScreen(),
    );
  }
}