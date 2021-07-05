import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.white),
          ),
          hintStyle: TextStyle(color: Colors.white.withAlpha(150)),
          hintText: "Search your movie",
          prefixIcon: Icon(CupertinoIcons.search, size: 20, color: Colors.white),
        ),
        onFieldSubmitted: (val) {
          Navigator.pushNamed(context, '/search', arguments: val);
        },
      ),
    );
  }
}
