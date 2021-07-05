import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netvie/features/bookmark/screen/bookmark_screen.dart';
import 'package:netvie/features/home/screen/home_screen.dart';
import 'package:netvie/features/movie/screen/movie_screen.dart';
import 'package:netvie/features/profile/screen/profile_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List _listBotNav = [
    {
      "lable": "home",
      "icon": CupertinoIcons.house,
      "selectedIcon": CupertinoIcons.house_fill,
      "screen": HomeScreen(),
    },
    {
      "lable": "movie",
      "icon": CupertinoIcons.compass,
      "selectedIcon": CupertinoIcons.compass_fill,
      "screen": MovieScreen(),
    },
    {
      "lable": "bookmark",
      "icon": CupertinoIcons.bookmark,
      "selectedIcon": CupertinoIcons.bookmark_fill,
      "screen": BookmarkScreen(),
    },
    {
      "lable": "profile",
      "icon": CupertinoIcons.person_alt_circle,
      "selectedIcon": CupertinoIcons.person_alt_circle_fill,
      "screen": ProfileScreen(),
    },
  ];

  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _listBotNav[_selectedPage]['screen'],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              _listBotNav.length,
              (index) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    splashRadius: 25,
                    icon: Icon(_selectedPage == index ? _listBotNav[index]['selectedIcon'] : _listBotNav[index]['icon'], color: Colors.blueAccent.shade700, size: 25),
                    onPressed: () {
                      setState(() {
                        _selectedPage = index;
                      });
                    },
                  ),
                  _selectedPage == index
                      ? Container(
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(color: Colors.blueAccent.shade700, borderRadius: BorderRadius.circular(10)),
                        )
                      : SizedBox(height: 5),
                ],
              ),
            )),
      ),
    );
  }
}
