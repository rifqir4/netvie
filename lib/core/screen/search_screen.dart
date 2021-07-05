import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netvie/core/widget/loading_widget.dart';
import 'package:netvie/core/service/api_service.dart';
import 'package:netvie/core/widget/movie_card.dart';
import 'package:netvie/features/movie/model/movie.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final search = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(CupertinoIcons.left_chevron, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 12),
                  Text("Search: $search", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: FutureBuilder<List<Movie>>(
                  future: ApiService.fetchSearchedMovie(search),
                  builder: (context, snap) => snap.connectionState != ConnectionState.done
                      ? LoadingWidget()
                      : ListView.builder(
                          itemCount: snap.data.length ?? 0,
                          itemBuilder: (context, idx) => MovieCard(snap.data[idx]),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
