import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix_clone/models/upcoming_model.dart';
import 'package:netflix_clone/services/api_services.dart';
import 'package:netflix_clone/widgets/movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UpcomingMovieModel> upcomingFuture;
  late Future<UpcomingMovieModel> nowplayingFuture;
  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    super.initState();
    upcomingFuture = apiServices.getUpcomingMovies();
    nowplayingFuture = apiServices.getNowPlayingMovies();
  }
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
      body:  SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
            height: 220,
             child: movieCardWidget(
              future: nowplayingFuture, headLineText: 'Now Playing Movies'),
           ),
           SizedBox(
            height: 210,
             child: movieCardWidget(
              future: upcomingFuture, headLineText: 'Upcoming Movies'),
           ),
          ],
        ),
      )
    );
  }
}