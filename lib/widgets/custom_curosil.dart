import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class customcurosal extends StatefulWidget {
  const customcurosal({super.key});

  @override
  State<customcurosal> createState() => _customcurosalState();
}

class _customcurosalState extends State<customcurosal> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SizedBox(
      width:size.width,
      height: (size.height * 0.33 < 300) ? 300 : size.height * 0.33,
    );
  }
}