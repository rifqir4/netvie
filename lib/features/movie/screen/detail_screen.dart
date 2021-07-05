import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netvie/core/provider/bookmark_provider.dart';
import 'package:netvie/core/widget/loading_widget.dart';
import 'package:netvie/core/service/api_service.dart';
import 'package:netvie/features/movie/model/movie.dart';
import 'package:netvie/features/movie/model/movie_detail.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isBuyed = false;

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Consumer<BookmarkProvider>(
              builder: (context, provider, _) => Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(CupertinoIcons.left_chevron, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text("Detail Movie", style: TextStyle(color: Colors.white)),
                    IconButton(
                      icon: Icon(
                        provider.isMarked(movie) ? CupertinoIcons.bookmark_fill : CupertinoIcons.bookmark,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        provider.bookmark(movie);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder<MovieDetail>(
              future: ApiService.fetchDetailMovie(movie.id),
              builder: (context, snap) => snap.connectionState != ConnectionState.done
                  ? LoadingWidget()
                  : Stack(
                      children: [
                        SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: Container(
                                    clipBehavior: Clip.antiAlias,
                                    width: 250,
                                    height: 400,
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent.shade700,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 0,
                                          spreadRadius: -15,
                                          color: Colors.blueAccent.shade200,
                                          offset: Offset(0, 35),
                                        ),
                                        BoxShadow(
                                          blurRadius: 0,
                                          spreadRadius: -10,
                                          color: Colors.blueAccent.shade400,
                                          offset: Offset(0, 20),
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Image.network(
                                      snap.data.image ?? "",
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
                                SizedBox(height: 50),
                                Text(snap.data.title, style: Theme.of(context).textTheme.headline1),
                                SizedBox(height: 12),
                                Row(
                                  children: [
                                    Text("Director: ${snap.data.director}  |  ${snap.data.rating} ", style: Theme.of(context).textTheme.headline3),
                                    Icon(Icons.star, color: Colors.orange, size: 18),
                                  ],
                                ),
                                SizedBox(height: 12),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: snap.data.genre.split(',').map((e) => _buildTag(e.trim())).toList(),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text("Synopsis", style: Theme.of(context).textTheme.headline3.copyWith(fontWeight: FontWeight.bold)),
                                SizedBox(height: 12),
                                Text(
                                  "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (!_isBuyed)
                          Positioned(
                              child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: [0.80, 1.0],
                                colors: [
                                  Colors.transparent,
                                  Color(0xFF070D2D),
                                ],
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 50.0),
                                child: ElevatedButton(
                                  child: Text("Read Synopsis"),
                                  onPressed: () {
                                    setState(() {
                                      _isBuyed = !_isBuyed;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ))
                      ],
                    ),
            )),
          ],
        ),
      ),
    );
  }

  Container _buildTag(String label) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.blueAccent.shade200,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
