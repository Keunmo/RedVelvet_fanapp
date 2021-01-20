import 'package:flutter/material.dart';
import 'package:redvelvet/components/fromstarparser.dart';

class Fromstar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text(
                "From Star",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Spacer(),
            ],
          ),
          FutureBuilder(
              future: fetchData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  print(snapshot);
                  print(snapshot.data);
                  return Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            snapshot.data.noti1['title'] +
                                '\n' +
                                snapshot.data.noti2['title'] +
                                '\n' +
                                snapshot.data.noti3['title'] +
                                '\n' +
                                snapshot.data.noti4['title'] +
                                '\n' +
                                snapshot.data.noti5['title'],
                            style: TextStyle(fontSize: 11),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            snapshot.data.noti1['date'] +
                                '\n' +
                                snapshot.data.noti2['date'] +
                                '\n' +
                                snapshot.data.noti3['date'] +
                                '\n' +
                                snapshot.data.noti4['date'] +
                                '\n' +
                                snapshot.data.noti5['date'],
                            style: TextStyle(fontSize: 13.5),
                          ),
                        ],
                      ),
                    ],
                  );
                }
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              })
        ],
      ),
    );
  }
}
