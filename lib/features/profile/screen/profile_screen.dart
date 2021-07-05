import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
          SizedBox(height: 20),
          Text(
            "Edward Nasution",
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: 50),
          ListTile(
            tileColor: Theme.of(context).accentColor,
            leading: Icon(Icons.email, color: Theme.of(context).primaryColor),
            title: Text("edwardnasution@gmail.com", style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 15)),
          ),
          SizedBox(height: 5),
          ListTile(
            tileColor: Theme.of(context).accentColor,
            leading: Icon(Icons.phone, color: Theme.of(context).primaryColor),
            title: Text("08123456789", style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 15)),
          ),
        ],
      ),
    );
  }
}
