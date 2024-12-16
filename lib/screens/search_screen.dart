import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_popular.dart';
import 'package:netflix_clone/models/search_movie.dart';
import 'package:netflix_clone/screens/movie_details_screen.dart';
import 'package:netflix_clone/services/api_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  ApiServices apiServices = ApiServices();
  late Future<MoviePopularModel> popularMovies;
  SearchMovieModel? searchMovieModel;

  @override
  void initState() {
    popularMovies = apiServices.getPopularMovie();
    super.initState();
  }

  void search(String query) {
    apiServices.getSearchMovie(query).then((results) {
      setState(() {
        searchMovieModel = results;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CupertinoSearchTextField(
                padding: const EdgeInsets.all(10),
                controller: searchController,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  Icons.cancel,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
                backgroundColor: Colors.grey.withOpacity(0.3),
                onChanged: (value) {
                  if (value.isEmpty) {
                  } else {
                    search(searchController.text);
                  }
                },
              ),
              searchController.text.isEmpty
                  ? FutureBuilder(
                      future: popularMovies,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          ('Error: ${snapshot.error}');
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        } else if (!snapshot.hasData ||
                            snapshot.data?.results == null) {
                          log('null');
                          return const SizedBox.shrink();
                        }
                        var data = snapshot.data?.results;
                        log('Fetched Data: ${snapshot.data}');
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(20),
                            const Text(
                              "Top searches",
                              style:
                                  TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: data!.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetailsScreen(movieid: data[index].id,)));
                                    },
                                    child: Container(
                                      height: 150,
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Row(
                                        children: [
                                          Image.network(
                                            '$imageUrl${data[index].posterPath}',
                                          ),
                                          const Gap(20),
                                          SizedBox(
                                              width: 260,
                                              child: Text(
                                                data[index].title,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ))
                                        ],
                                      ),
                                    ),
                                  );
                                })
                          ],
                        );
                      })
                  : searchMovieModel == null
                      ? const SizedBox.shrink()
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: searchMovieModel!.results.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 5,
                                  childAspectRatio: 1.2 / 2),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetailsScreen(movieid: searchMovieModel!.results[index].id))); 
                              },
                              child: Column(
                                children: [
                                  searchMovieModel!.results[index].backdropPath ==
                                          null
                                      ? Image.asset(
                                          'assets/Netflix-new-icon.png',
                                          height: 170,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl:
                                              '$imageUrl${searchMovieModel!.results[index].backdropPath}',
                                          height: 170,
                                        ),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      searchMovieModel!
                                          .results[index].originalTitle,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  )
                                ],
                              ),
                            );
                          })
            ],
          ),
        ),
      ),
    );
  }
}
