import 'package:flutter/material.dart';
import 'package:redvelvet/components/noticeparser.dart';

class Notice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Text(
                "Notice",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Spacer(),
            ],
          ),
          FutureBuilder(
              future: fetchData(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  snapshot.data.noti1['title'],
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  snapshot.data.noti2['title'],
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  snapshot.data.noti3['title'],
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  snapshot.data.noti4['title'],
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  snapshot.data.noti5['title'],
                                  style: TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                            // Text(
                            //   snapshot.data.noti1['title'] +
                            //       '\n' +
                            //       snapshot.data.noti2['title'] +
                            //       '\n' +
                            //       snapshot.data.noti3['title'] +
                            //       '\n' +
                            //       snapshot.data.noti4['title'] +
                            //       '\n' +
                            //       snapshot.data.noti5['title'],
                            //   style: TextStyle(fontSize: 11),
                            // ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(children: [
                              Text(
                                snapshot.data.noti1['date'],
                                style: TextStyle(fontSize: 14),
                              )
                            ]),
                            Row(children: [
                              Text(
                                snapshot.data.noti2['date'],
                                style: TextStyle(fontSize: 14),
                              )
                            ]),
                            Row(children: [
                              Text(
                                snapshot.data.noti3['date'],
                                style: TextStyle(fontSize: 14),
                              )
                            ]),
                            Row(children: [
                              Text(
                                snapshot.data.noti4['date'],
                                style: TextStyle(fontSize: 14),
                              )
                            ]),
                            Row(children: [
                              Text(
                                snapshot.data.noti5['date'],
                                style: TextStyle(fontSize: 14),
                              )
                            ]),
                            // Text(
                            //   snapshot.data.noti1['date'] +
                            //       '\n' +
                            //       snapshot.data.noti2['date'] +
                            //       '\n' +
                            //       snapshot.data.noti3['date'] +
                            //       '\n' +
                            //       snapshot.data.noti4['date'] +
                            //       '\n' +
                            //       snapshot.data.noti5['date'],
                            //   style: TextStyle(fontSize: 13.5),
                            // ),
                          ],
                        ),
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
