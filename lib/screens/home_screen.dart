import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Image.asset("assets/netflix.png",height: 40,width: 120,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right:20.0),
            child: IconButton(onPressed: (){}, 
            icon: const Icon(Icons.search,size: 30,color: Colors.white,)),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              height: 27,
              width: 27,
              color: Colors.blue,
            ),
          ),
          const Gap(20)
        ],
        
      ),
      body: const Center(
        child: Text('its home screen'),
      ),
    );
  }
}