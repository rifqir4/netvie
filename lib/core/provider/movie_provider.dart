import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieProvider extends ChangeNotifier {
  final List<Map> kCategoriesData = [
    {"lable": "Horor", "icon": Icon(Icons.access_alarm), "value": "paranormal"},
    {"lable": "Comedy", "icon": Icon(Icons.person), "value": "bean"},
    {"lable": "Action", "icon": Icon(Icons.video_label), "value": "avenger"},
    {"lable": "Thriller", "icon": Icon(Icons.power_input), "value": "the hunt"},
    {"lable": "Gun", "icon": Icon(Icons.gps_fixed), "value": "the raid"},
    {"lable": "Drama", "icon": Icon(Icons.closed_caption), "value": "laskar"},
    {"lable": "Roman", "icon": Icon(Icons.list_sharp), "value": "titanic"},
    {"lable": "Musical", "icon": Icon(Icons.music_note), "value": "showman"},
  ];

  int selectedCategory = 0;

  Map get categoryMap => kCategoriesData[selectedCategory];

  void changeCategory(int i) {
    selectedCategory = i;
    notifyListeners();
  }
}
