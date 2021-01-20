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
  String url = "http://redvelvet.smtown.com/Board/List/10325";
  Map<String, String> header = {'Accept-Language': 'ko-KR'};
  http.Response response = await http.get(url, headers: header);
  if (response.statusCode == 200) {
    Document document = parser.parse(response.body);
    List<Element> keywordElements = document.querySelectorAll("tbody > tr");
    // print(keywordElements[0].text);
    List<Map<String, dynamic>> keywords = [];
    for (var element in keywordElements) {
      // print(element.text);
      Element title = element.children[1];
      Element date = element.children[3];
      keywords.add({
        'title': title.text,
        'date': date.text,
        'link': title.attributes['seq'],
      });
    }
    // print(keywords);
    return Parseresult.fromkeywords(keywords);
  } else {
    throw Exception('Failed to load parse result');
  }
}
// #conLfBoard > table > tbody > tr:nth-child(1) > td.story > p > a
// #conLfBoard > table > tbody > tr:nth-child(1) > td:nth-child(3) > span
// #conLfBoard > table > tbody > tr:nth-child(1) > td:nth-child(4)

// #conLfBoard > table > tbody > tr:nth-child(1)
// #conLfBoard > table > tbody > tr:nth-child(2)

// #conLfBoard > table > tbody > tr:nth-child(1) > td.story > p > a
// #conLfBoard > table > tbody > tr:nth-child(1) > td:nth-child(4)
