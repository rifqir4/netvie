import 'package:flutter/material.dart';
import 'package:netvie/core/provider/bookmark_provider.dart';
import 'package:netvie/core/provider/movie_provider.dart';
import 'package:netvie/features/movie/screen/detail_screen.dart';
import 'package:netvie/core/screen/main_screen.dart';
import 'package:netvie/core/screen/search_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieProvider()),
        ChangeNotifierProvider(create: (_) => BookmarkProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          accentColor: Color(0xFF3C4682),
          textTheme: TextTheme(
            headline1: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
            headline2: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            headline3: TextStyle(color: Colors.white, fontSize: 18),
            bodyText1: TextStyle(color: Colors.white),
            subtitle1: TextStyle(color: Colors.white.withAlpha(130), fontSize: 15),
          ),
          scaffoldBackgroundColor: Color(0xFF070D2D),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => MainScreen(),
          '/detail': (_) => DetailScreen(),
          '/search': (_) => SearchScreen(),
        },
      ),
    );
  }
}
