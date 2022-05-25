import 'dart:convert';

import 'package:news_eyepax/model/article.dart';
import 'package:http/http.dart' as http;
import 'package:news_eyepax/model/full_result.dart';

// News API related operations
class NewsAPI {
  final String _newsApiKey = '2f6cc7ac4e434142a5844256d0d65ffa';
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
  Future<FullResult> getEverything({ String? q, String? sortBy, int? page, String? language }) async {
    List<Article> articles = [];
    String url = '$baseUrl/top-headlines?apiKey=$_newsApiKey';
    if(q != null) url+='&q=$q';
    if(sortBy != null) url+='&sortBy=$sortBy';
    if(page != null) url+='&page=$page';
    if(language != null) url+='&language=$language';
    int count = 0;
    try{
      dynamic data = jsonDecode(await http.read(Uri.parse(url),));
      articles = data['articles'].map<Article>((item)=>Article.fromJson(item)).toList();
      count = data['totalResults'];
    } catch(e) {
      articles = [];
    }
    FullResult result = FullResult(articles, count);
    return result;
  }
}