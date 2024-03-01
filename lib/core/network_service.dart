// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/news_data_model.dart';

class NetworkService {
  static String apiKey = "000484cc266a46d4b1d7c7266363256b";
  static DateTime currentTime =
      DateTime.now().subtract(const Duration(days: 1));
  static String getBaseurl(String category) {
    return "https://newsapi.org/v2/everything?q=$category&from=${currentTime.year}-${currentTime.month}-${currentTime.day}&sortBy=publishedAt&apiKey=$apiKey";
  }

  static NewsModelClass? newsModelClass;

  static Future<NewsModelClass?> getAllTodayArticles(String category) async {
    String url = getBaseurl(category);
    try {
      http.Response response = await http.get(Uri.parse(url));
      print('Response Body--> ${response.body}');
      if (response.statusCode == 200) {
        return NewsModelClass.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print('Error in Calling News API:- $e');
    }
    return null;
  }
}
