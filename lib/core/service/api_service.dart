import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netvie/features/movie/model/movie.dart';
import 'package:netvie/features/movie/model/movie_detail.dart';

class ApiService {
  static Future<List<Movie>> fetchAllMovie() async {
    final response = await http.get("http://omdbapi.com/?apikey=17db411e&s=maze");
    if (response.statusCode != 200) throw "Error";
    final json = jsonDecode(response.body.toString());

    final List<Movie> _listMovie = [];
    (json['Search'] as List).forEach((element) {
      _listMovie.add(Movie.fromJson(element));
    });

    return _listMovie;
  }

  static Future<List<Movie>> fetchPopularMovie(String value) async {
    final response = await http.get("http://omdbapi.com/?apikey=17db411e&s=$value");
    if (response.statusCode != 200) throw "Error";
    final json = jsonDecode(response.body.toString());

    final List<Movie> _listMovie = [];
    (json['Search'] as List).forEach((element) {
      _listMovie.add(Movie.fromJson(element));
    });

    return _listMovie;
  }

  static Future<MovieDetail> fetchDetailMovie(String id) async {
    final response = await http.get("http://omdbapi.com/?apikey=17db411e&i=$id");
    if (response.statusCode != 200) throw "Error";
    final json = jsonDecode(response.body.toString());
    if (json['Response'] == "False") throw "Error";
    return MovieDetail.fromJson(json);
  }

  static Future<List<Movie>> fetchSearchedMovie(String title) async {
    final response = await http.get("http://omdbapi.com/?apikey=17db411e&s=$title");
    if (response.statusCode != 200) throw "Error";
    final json = jsonDecode(response.body.toString());
    if (json['Response'] == "False") throw "Error";

    final List<Movie> _listMovie = [];
    (json['Search'] as List).forEach((element) {
      _listMovie.add(Movie.fromJson(element));
    });

    return _listMovie;
  }
}
