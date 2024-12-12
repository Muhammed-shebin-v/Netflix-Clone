import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Model Classes
class UpcomingMovieModel {
  final Dates? dates;
  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  UpcomingMovieModel({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory UpcomingMovieModel.fromJson(Map<String, dynamic> json) {
    return UpcomingMovieModel(
      dates: json["dates"] != null ? Dates.fromJson(json["dates"]) : null,
      page: json["page"] ?? 0,
      results: json["results"] != null
          ? List<Result>.from(json["results"].map((x) => Result.fromJson(x)))
          : [],
      totalPages: json["total_pages"] ?? 0,
      totalResults: json["total_results"] ?? 0,
    );
  }
}

class Dates {
  final DateTime? maximum;
  final DateTime? minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  factory Dates.fromJson(Map<String, dynamic> json) {
    return Dates(
      maximum:
          json["maximum"] != null ? DateTime.parse(json["maximum"]) : null,
      minimum:
          json["minimum"] != null ? DateTime.parse(json["minimum"]) : null,
    );
  }
}

class Result {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime? releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      adult: json["adult"] ?? false,
      backdropPath: json["backdrop_path"] ?? '',
      genreIds: json["genre_ids"] != null
          ? List<int>.from(json["genre_ids"].map((x) => x))
          : [],
      id: json["id"] ?? 0,
      originalLanguage: json["original_language"] ?? 'en',
      originalTitle: json["original_title"] ?? '',
      overview: json["overview"] ?? '',
      popularity: json["popularity"]?.toDouble() ?? 0.0,
      posterPath: json["poster_path"] ?? '',
      releaseDate: json["release_date"] != null
          ? DateTime.parse(json["release_date"])
          : null,
      title: json["title"] ?? '',
      video: json["video"] ?? false,
      voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
      voteCount: json["vote_count"] ?? 0,
    );
  }
}

// Network Call
Future<UpcomingMovieModel> fetchUpcomingMovies() async {
  const url = "https://api.themoviedb.org/3/movie/upcoming?api_key=YOUR_API_KEY";
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return UpcomingMovieModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load movies');
  }
}

// Main Widget
class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Upcoming Movies'),
        ),
        body: const MovieList(),
      ),
    );
  }
}

// Movie List Widget
class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late Future<UpcomingMovieModel> futureMovies;

  @override
  void initState() {
    super.initState();
    futureMovies = fetchUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UpcomingMovieModel>(
      future: futureMovies,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          log('Error: ${snapshot.error}');
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.results.isEmpty) {
          log('No data found');
          return const Center(child: Text('No data found'));
        }

        var movies = snapshot.data!.results;
        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Image.network(
                  'https://image.tmdb.org/t/p/w500${movies[index].posterPath}'),
              title: Text(movies[index].title),
              subtitle: Text(movies[index].overview),
            );
          },
        );
      },
    );
  }
}

void main() => runApp(const MovieApp());
