import 'package:flutter/material.dart';
import 'package:netflix_clone/screens/home_screen.dart';
import 'package:netflix_clone/screens/more_screen.dart';
import 'package:netflix_clone/screens/search_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, child: Scaffold(
        body: const TabBarView(children: [
          HomeScreen(),
          SearchScreen(),
          MoreScreen()
        ]),
        bottomNavigationBar: Container(
          color: Colors.black,
          child: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.home),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.search),
              text: 'Search',
            ),
            Tab(
              icon: Icon(Icons.photo_library_outlined),
              text: 'New & Hot',
            )
          ],
          indicatorColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Color.fromARGB(255, 144, 141, 141),
          ),
          
        ),
      ));
  }
}