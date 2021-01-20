import 'package:flutter/material.dart';
import 'package:redvelvet/theme.dart';
import 'package:redvelvet/widgets/navdrawer.dart';
import 'package:redvelvet/components/fanboard.dart';
import 'package:redvelvet/components/notice.dart';
import 'package:redvelvet/components/fromstar.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Image.asset(
          'lib/assets/rvlogo.png',
          scale: 10.0,
        ),
        centerTitle: true,
      ),
      backgroundColor: RVColors.coral[100],
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                Container(
                  //RV main bg img
                  height: 390.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                      image: NetworkImage(
                          "http://socdn.smtown.com/upload/starhome/layout/redvelvet/ver16/StarhomeBgImg.jpg?20191223181401"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Notice(),
                SizedBox(height: 20.0),
                Fanboard(),
                SizedBox(height: 20.0),
                Fromstar(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
