import 'package:flutter/material.dart';
import 'package:netvie/core/provider/movie_provider.dart';
import 'package:netvie/core/widget/loading_widget.dart';
import 'package:netvie/core/service/api_service.dart';
import 'package:netvie/features/movie/model/movie.dart';
import 'package:provider/provider.dart';

class HomeMovieList extends StatefulWidget {
  const HomeMovieList({Key key}) : super(key: key);

  @override
  _HomeMovieListState createState() => _HomeMovieListState();
}

class _HomeMovieListState extends State<HomeMovieList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, provider, _) => FutureBuilder<List<Movie>>(
        future: ApiService.fetchPopularMovie(provider.categoryMap['value']),
        builder: (context, snap) => snap.connectionState != ConnectionState.done
            ? LoadingWidget()
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: snap.data
                        .map(
                          (movie) => InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/detail', arguments: movie);
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 15),
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Container(
                                      width: 150,
                                      height: 200,
                                      color: Theme.of(context).accentColor,
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
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    movie.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context).textTheme.headline3,
                                    softWrap: false,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: List.generate(5, (index) => Icon(Icons.star, color: Colors.orange)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList())),
      ),
    );
  }
}
