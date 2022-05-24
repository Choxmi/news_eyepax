import 'dart:convert';

import 'package:news_eyepax/model/article.dart';
import 'package:http/http.dart' as http;

// News API related operations
class NewsAPI {
  final String _newsApiKey = 'c13e50f4e450415f9a56d261e3cfcb69';
  final String baseUrl = 'https://newsapi.org/v2/';

  // Get headlines/Breaking news
  Future<List<Article>> getHeadlines({ String? country, String? q, String? language, String? category }) async {
    List<Article> articles = [];
    String url = '$baseUrl/top-headlines?apiKey=$_newsApiKey';
    if(country != null) url+='&country=$country';
    if(q != null) url+='&q=$q';
    if(language != null) url+='&language=$language';
    if(category != null) url+='&category=$category';
    try{
      dynamic data = jsonDecode(await http.read(Uri.parse(url),));
      print(url);
      articles = data['articles'].map<Article>((item)=>Article.fromJson(item)).toList();
    } catch(e) {
      articles = [];
    }
    return articles;
  }

  // Get from everything API
  Future<List<Article>> getEverything({ String? q, String? sortBy, int? page }) async {
    List<Article> articles = [];
    String url = '$baseUrl/top-headlines?apiKey=$_newsApiKey';
    if(q != null) url+='&q=$q';
    if(sortBy != null) url+='&sortBy=$sortBy';
    if(page != null) url+='&page=$page';
    try{
      dynamic data = jsonDecode(await http.read(Uri.parse(url),));
      articles = data['articles'].map<Article>((item)=>Article.fromJson(item)).toList();
    } catch(e) {
      articles = [];
    }
    return articles;
  }
}