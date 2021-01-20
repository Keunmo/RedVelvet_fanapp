import 'package:flutter/material.dart';
import 'package:redvelvet/screens/home_screen.dart';
import 'package:redvelvet/screens/fromstar_screen.dart';
import 'package:redvelvet/theme.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Red Velvet',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: RVColors.coral[50],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {
              Navigator.of(context).pop(),
              // Navigator.pushReplacement(
              //   context,
              //   MaterialPageRoute(builder: (context) => HomeScreen()),
              // )
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.assistant_photo),
            title: Text('Notice'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.favorite_border),
            title: Text('Fanboard'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('From Star'),
            onTap: () => {
              Navigator.of(context).pop(),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FromStar(),
                ),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.library_music),
            title: Text('Discography'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.photo_library),
            title: Text('Gallery'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.video_library),
            title: Text('Videos'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
