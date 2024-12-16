import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/upcoming_model.dart';
import 'package:netflix_clone/screens/movie_details_screen.dart';

class movieCardWidget extends StatelessWidget {
  final Future<UpcomingMovieModel> future;
  final String headLineText;
  const movieCardWidget({super.key,required this.future,required this.headLineText});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: future, builder: (context,snapshot){
      if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      log('Error: ${snapshot.error}');
      return Center(child: Text('Error: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data?.results == null) {
      log('null');
      return const SizedBox.shrink();
    }
      var data = snapshot.data?.results;
      log('Fetched Data: ${snapshot.data}');
      return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(headLineText,style: const TextStyle(fontWeight: FontWeight.bold),),
              const Gap(20),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                  return 
                  InkWell(
                    onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetailsScreen(movieid: data[index].id))); 
                              },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Image.network('$imageUrl${data[index].posterPath}',),
                    ),
                  );
                }),
              )
            ],
      );
    });
  }
}