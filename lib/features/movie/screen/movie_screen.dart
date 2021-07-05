import 'package:flutter/material.dart';
import 'package:netvie/core/service/api_service.dart';
import 'package:netvie/core/widget/loading_widget.dart';
import 'package:netvie/core/widget/movie_card.dart';
import 'package:netvie/features/movie/model/movie.dart';
import 'package:netvie/features/movie/widget/movie_appbar.dart';

class MovieScreen extends StatefulWidget {
  MovieScreen({Key key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MovieAppbar(),
        Expanded(
            child: FutureBuilder<List<Movie>>(
          future: ApiService.fetchAllMovie(),
          builder: (context, snap) => snap.connectionState != ConnectionState.done
              ? LoadingWidget()
              : ListView.builder(
                  itemBuilder: (context, idx) => MovieCard(snap.data[idx]),
                ),
        ))
      ],
    );
  }
}
