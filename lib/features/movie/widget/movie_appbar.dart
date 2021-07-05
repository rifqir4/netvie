import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieAppbar extends StatelessWidget {
  const MovieAppbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Row(
        children: [
          SizedBox(width: 12),
          Text("Movie List", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
