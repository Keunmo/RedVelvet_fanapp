import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;

class Parseresult {
  final Map noti1;
  final Map noti2;
  final Map noti3;
  final Map noti4;
  final Map noti5;

  // Parseresult({this.title, this.name, this.date, this.link});
  Parseresult({this.noti1, this.noti2, this.noti3, this.noti4, this.noti5});

  factory Parseresult.fromkeywords(List<Map<String, dynamic>> keywords) {
    // print(keywords);
    return Parseresult(
      noti1: keywords[0],
      noti2: keywords[1],
      noti3: keywords[2],
      noti4: keywords[3],
      noti5: keywords[4],
    );
  }
}

Future<Parseresult> fetchData() async {
  String url = "http://redvelvet.smtown.com/Board/List/10324";
  Map<String, String> header = {'Accept-Language': 'ko-KR'};
  http.Response response = await http.get(url, headers: header);
  if (response.statusCode == 200) {
    Document document = parser.parse(response.body);
    List<Element> keywordElements = document.querySelectorAll("tbody > tr");
    // print(keywordElements[1].text);
    List<Map<String, dynamic>> keywords = [];
    for (var element in keywordElements) {
      // print(element.text);
      // Element title = element.querySelector('p > a');
      Element title = element.children[2].children[0].children[0];
      if (title.text.length >= 33) {
        title.text = title.text.substring(0, 32) + '..';
      }
      // Element name = element.querySelector('td > strong');
      Element name = element.children[3];
      Element date = element.children[4];
      // String link = element.children[2].children[0].children[0].attributes['seq'];
      keywords.add({
        'title': title.text,
        'name': name.text,
        'date': date.text,
        'link': title.attributes['seq'],
        // 'link': link,
        // 'link2': title.attributes,
      });
    }
    // print(keywords);
    return Parseresult.fromkeywords(keywords);
  } else {
    throw Exception('Failed to load parse result');
  }
}

// #conLfBoard > table > tbody > tr:nth-child(1)
// #conLfBoard > table > tbody > tr:nth-child(2)

// #conLfBoard > table > tbody > tr:nth-child(1) > td:nth-child(1)
// #conLfBoard > table > tbody > tr:nth-child(1) > td:nth-child(2)
// #conLfBoard > table > tbody > tr:nth-child(1) > td.story > p > a
// #conLfBoard > table > tbody > tr:nth-child(1) > td:nth-child(4) > strong
// #conLfBoard > table > tbody > tr:nth-child(1) > td:nth-child(5)
// #conLfBoard > table > tbody > tr:nth-child(1) > td.ft11.artCol1

// http://redvelvet.smtown.com/Board/Details/7287219
