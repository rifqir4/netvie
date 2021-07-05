import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netvie/core/provider/bookmark_provider.dart';
import 'package:netvie/features/movie/model/movie.dart';
import 'package:provider/provider.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard(this.movie, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: movie);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        color: Theme.of(context).accentColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              child: Image.network(
                movie.image ?? "",
                fit: BoxFit.cover,
                errorBuilder: (context, a, b) => Center(
                    child: Text(
                  "No Image",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${movie.year} - ${movie.type}",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF070D2D),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        padding: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Icon(Icons.star, size: 15, color: Colors.orange),
                            SizedBox(width: 5),
                            Text("6.5", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                      Consumer<BookmarkProvider>(
                        builder: (context, provider, _) => IconButton(
                          icon: Icon(
                            provider.isMarked(movie) ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            provider.bookmark(movie);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
