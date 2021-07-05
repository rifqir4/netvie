class Movie {
  final String id;
  final String title;
  final String image;
  final String year;
  final String type;

  Movie({this.id, this.title, this.image, this.year, this.type});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['imdbID'],
        title: json['Title'],
        image: json['Poster'],
        year: json['Year'],
        type: json['Type'],
      );
}
