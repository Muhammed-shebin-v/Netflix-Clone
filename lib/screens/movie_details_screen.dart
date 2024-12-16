import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_details.dart';
import 'package:netflix_clone/models/movie_recommendations.dart';
import 'package:netflix_clone/services/api_services.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieid;
  const MovieDetailsScreen({super.key, required this.movieid});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  ApiServices apiServices = ApiServices();
  late Future<MovieDetailsModel> movieDetail;
  late Future<MovierecommendationsModel> moviereco;
  @override
  void initState() {
    fetchinitialDetail();
    super.initState();
  }

  fetchinitialDetail() {
    movieDetail = apiServices.getMovieDetails(widget.movieid);
    moviereco= apiServices.getMovieRecommends(widget.movieid);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print(' movie id is ${widget.movieid}');
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: movieDetail,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final movie = snapshot.data;
                String generaText =
                    movie!.genres.map((genre) => genre.name).join(',  ');

                return Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                    '$imageUrl${movie.posterPath}',
                                  ),
                                  fit: BoxFit.cover)),
                          child: SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(20),
                        Text(
                          movie.title,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Text(
                              movie.releaseDate.year.toString(),
                              style: const TextStyle(color: Colors.grey),
                            ),
                            Gap(10),
                            Text(
                              generaText,
                              style: const TextStyle(
                                  fontSize: 17, color: Colors.grey),
                            ),
                          ],
                        ),
                        const Gap(20),
                        Text(
                          movie.overview,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 17),
                        )
                      ],
                    ),
                    Gap(30),
                    FutureBuilder(
                      future: moviereco, 
                      builder: (context,snapshot){
                        if(snapshot.hasData){
                          final movie = snapshot.data;

                          return movie!.results.isEmpty?
                          SizedBox()
                          :Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("More Like This"),
                              SizedBox(
                                height: 20,
                              ),
                              GridView.builder(
                                itemCount: movie.results.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 5,
                                  childAspectRatio: 1.5 / 2),
                                  itemBuilder: (context,index){
                                   return InkWell(
                                    onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetailsScreen(movieid: movie.results[index].id))); 
                                 },
                                    child: CachedNetworkImage(imageUrl: '${imageUrl}${movie.results[index].posterPath}',));
                                  })
                            ],
                          );
                        }return Text('something wenrt wrong');
                      })
                  ],
                );
              } else {
                return const SizedBox();
              }
            }),
      ),
    );
  }
}
