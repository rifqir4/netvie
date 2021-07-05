import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookmarkAppbar extends StatelessWidget {
  const BookmarkAppbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Row(
        children: [
          SizedBox(width: 12),
          Text("Bookmark List", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
