import 'package:netvie/features/movie/model/movie.dart';

class MovieDetail extends Movie {
  final String rating;
  final String director;
  final String genre;

  MovieDetail({
    String id,
    String title,
    String image,
    String year,
    String type,
    this.rating,
    this.director,
    this.genre,
  }) : super(
          id: id,
          title: title,
          image: image,
          year: year,
          type: type,
        );

  factory MovieDetail.fromJson(Map<String, dynamic> json) => MovieDetail(
        id: json['imdbID'],
        title: json['Title'],
        image: json['Poster'],
        year: json['Year'],
        type: json['Type'],
        director: json['Director'],
        rating: json['imdbRating'],
        genre: json['Genre'],
      );
}
