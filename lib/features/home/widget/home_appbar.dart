import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Text(
            "Hi, Edward!",
            style: Theme.of(context).textTheme.headline1,
          ),
          Spacer(),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          )
        ],
      ),
    );
  }
}
