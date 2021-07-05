import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netvie/features/home/widget/home_appbar.dart';
import 'package:netvie/features/home/widget/home_categories.dart';
import 'package:netvie/features/home/widget/home_movie_list.dart';
import 'package:netvie/features/home/widget/home_search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
          child: Column(
            children: [
              HomeAppBar(),
              HomeSearch(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: HomeCategories(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Popular", style: Theme.of(context).textTheme.headline3),
                          Spacer(),
                          Text("see more", style: Theme.of(context).textTheme.subtitle1),
                        ],
                      ),
                      SizedBox(height: 15),
                      HomeMovieList()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
