import 'dart:convert';

import 'package:news_eyepax/model/article.dart';
import 'package:http/http.dart' as http;

// News API related operations
class NewsAPI {
  final String _newsApiKey = 'c13e50f4e450415f9a56d261e3cfcb69';
  final String baseUrl = 'https://newsapi.org/v2/';

  // Get headlines/Breaking news
  Future<List<Article>> getHeadlines({ String? country }) async {
    List<Article> articles = [];
    try{
      dynamic data = jsonDecode(await http.read(Uri.parse('$baseUrl/top-headlines?country=${country??'us'}&apiKey=$_newsApiKey'),));
      articles = data['articles'].map<Article>((item)=>Article.fromJson(item)).toList();
    } catch(e) {
      articles = [];
    }
    return articles;
  }
}