import 'package:flutter/material.dart';
import 'package:netvie/core/provider/bookmark_provider.dart';
import 'package:netvie/features/bookmark/widget/bookmark_appbar.dart';
import 'package:provider/provider.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookmarkProvider _provider = context.read<BookmarkProvider>();

    return Column(
      children: [
        BookmarkAppbar(),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            itemCount: _provider.bookmarkList.length,
            itemBuilder: (context, idx) => GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/detail', arguments: _provider.bookmarkList[idx]);
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Theme.of(context).accentColor,
                ),
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: Image.network(
                        _provider.bookmarkList[idx].image ?? "",
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
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bookmark, color: Colors.white),
                            Text(_provider.bookmarkList[idx].title, style: TextStyle(color: Colors.white, fontSize: 12)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 5 / 6, crossAxisCount: 2, crossAxisSpacing: 20.0, mainAxisSpacing: 15.0),
          ),
        ),
      ],
    );
  }
}
