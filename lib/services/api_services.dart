import 'dart:convert';
import 'dart:developer';
import 'package:netflix_clone/common/utils.dart';
import 'package:netflix_clone/models/movie_details.dart';
import 'package:netflix_clone/models/movie_popular.dart';
import 'package:netflix_clone/models/movie_recommendations.dart';
import 'package:netflix_clone/models/search_movie.dart';
import 'package:netflix_clone/models/tv_series.dart';
import 'package:netflix_clone/models/upcoming_model.dart';
import 'package:http/http.dart' as http;

const baseUrl="https://api.themoviedb.org/3/";
var key="?api_key=$apikey";
late String endPoint;

class ApiServices{
  Future<UpcomingMovieModel> getUpcomingMovies() async{
    endPoint='movie/upcoming';
    final url='$baseUrl$endPoint$key';
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      log('success');
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load upcoming movies');
  }
  Future<UpcomingMovieModel> getNowPlayingMovies() async{
    endPoint='movie/now_playing';
    final url='$baseUrl$endPoint$key';
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      log('success');
      return UpcomingMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load nowplaying movies');
  }
  Future<TvSeriesModel> getTopRatedSeries() async{
    endPoint='tv/top_rated';
    final url='$baseUrl$endPoint$key';
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      log('success');
      return TvSeriesModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load toprated  tvseries');
  }
  Future<SearchMovieModel> getSearchMovie(String searchText) async{
    endPoint='search/movie';
    final url='$baseUrl$endPoint$key&query=$searchText';
    log('search url is $url');
    final response=await http.get(Uri.parse(url) );
    if(response.statusCode==200){
      log('success');
      return SearchMovieModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load toprated  tvseries');
  }
  Future<MoviePopularModel> getPopularMovie() async{
    endPoint='movie/popular';
    final url='$baseUrl$endPoint$key';
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      log('success');
      return MoviePopularModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load popular  movies');
  }
  Future<MovieDetailsModel> getMovieDetails(int movieID) async{
    endPoint='movie/$movieID';
    final url='$baseUrl$endPoint$key';
    final response=await http.get(Uri.parse(url) );
    log('details url is $url');
    if(response.statusCode==200){
      log('success');
      return MovieDetailsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load movie  details');
  }
   Future<MovierecommendationsModel> getMovieRecommends(int movieID) async{
    endPoint='movie/$movieID/recommendations';
    final url='$baseUrl$endPoint$key';
    final response=await http.get(Uri.parse(url) );
    log('recommendation url is $url');
    if(response.statusCode==200){
      log('success');
      return MovierecommendationsModel.fromJson(jsonDecode(response.body));
    }
    throw Exception('failed to load movie  details');
  }
}