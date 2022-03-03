import 'dart:convert';
import 'package:gutenbergproject/models.dart';
import 'package:http/http.dart' as http;

Future<List<Book>> getSectionItems(String link, Function f) async {
  String url = link;
  var response = await http.get(Uri.parse(url));
  Map<String, dynamic> decodedResponse = jsonDecode(response.body);

  try {
    List result = List.from(decodedResponse["results"]);
    List<Book> books = result
        .map((book) => Book(
            title: book["title"],
            image: book["formats"]["image/jpeg"],
            authors: book["authors"],
            formats: book["formats"]))
        .toList();
    f(false, decodedResponse["next"] ?? "finished");
    return books;
  } catch (e) {
    List<Book> book1 = [
      Book(
          authors: [
            {"hi": "hello"}
          ],
          title: "NOt loaded",
          image: "no Image",
          formats: {"hi": "hello"})
    ];
    f(false, "hi");
    return book1;
  }
}
