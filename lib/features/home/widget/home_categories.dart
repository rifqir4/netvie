import 'package:flutter/material.dart';
import 'package:netvie/core/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class HomeCategories extends StatefulWidget {
  const HomeCategories({Key key}) : super(key: key);

  @override
  _HomeCategoriesState createState() => _HomeCategoriesState();
}

class _HomeCategoriesState extends State<HomeCategories> {
  bool isMore = false;

  List<Map> _listCategories = [];

  @override
  void initState() {
    super.initState();
    _listCategories = context.read<MovieProvider>().kCategoriesData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Text("Categories", style: Theme.of(context).textTheme.headline3),
              Spacer(),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      isMore = !isMore;
                    });
                  },
                  child: Text("see more", style: Theme.of(context).textTheme.subtitle1)),
            ],
          ),
          SizedBox(height: 15),
          Consumer<MovieProvider>(
            builder: (context, provider, _) => GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: isMore ? _listCategories.length : 4,
              itemBuilder: (context, idx) => GestureDetector(
                onTap: () {
                  provider.changeCategory(idx);
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: 70,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: provider.selectedCategory == idx ? Colors.blue : Theme.of(context).accentColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _listCategories[idx]['icon'],
                      SizedBox(height: 5),
                      Text("${_listCategories[idx]['lable']}", style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 5 / 6, crossAxisCount: 4, crossAxisSpacing: 15.0, mainAxisSpacing: 10.0),
            ),
          ),
        ],
      ),
    );
  }
}
