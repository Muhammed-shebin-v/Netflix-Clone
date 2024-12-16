import 'dart:convert';

class SearchMovieModel {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  SearchMovieModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory SearchMovieModel.fromRawJson(String str) =>
      SearchMovieModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SearchMovieModel.fromJson(Map<String, dynamic> json) =>
      SearchMovieModel(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Result {
  bool adult;
  String? backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String? posterPath;
  String? releaseDate;
  String title;
  bool? video;
  double voteAverage;
  int voteCount;

  Result({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    required this.title,
    this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Result.fromRawJson(String str) =>
      Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"] ?? "unknown",
        originalTitle: json["original_title"] ?? "Untitled",
        overview: json["overview"] ?? "No overview available.",
        popularity: (json["popularity"] ?? 0).toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"] ?? "No title",
        video: json["video"],
        voteAverage: (json["vote_average"] ?? 0).toDouble(),
        voteCount: json["vote_count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
 