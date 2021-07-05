import 'package:flutter/cupertino.dart';
import 'package:netvie/features/movie/model/movie.dart';

class BookmarkProvider extends ChangeNotifier {
  List<Movie> bookmarkList = [];

  bool isMarked(Movie movie) {
    return bookmarkList.where((element) => element.id == movie.id).toList().length > 0;
  }

  void bookmark(Movie movie) {
    if (isMarked(movie)) {
      bookmarkList.removeWhere((element) => element.id == movie.id);
    } else {
      bookmarkList.add(movie);
    }
    notifyListeners();
  }
}
