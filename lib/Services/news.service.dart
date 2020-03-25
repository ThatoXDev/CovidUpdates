import 'dart:convert';

import 'package:covid_updates/Models/news.model.dart';
import 'package:http/http.dart' as http;

final url =
    "http://newsapi.org/v2/top-headlines?q=covid&apiKey=f5e8f6c12e0d4479abb9479e69686b11&country=za";
Future<CovidNews> getCovidNews() async {
  CovidNews news;
  try {
    http.Response response = await http.get("$url");

    //convert response to json
    if (response.statusCode == 200) {
      var _articles = json.decode(response.body);
      news = CovidNews.fromJson(_articles);
    } else {
      news = null;
    }
  } catch (e) {
    news = e;
  }
  return news;
}
