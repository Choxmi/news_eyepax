import 'package:news_eyepax/model/article.dart';

class FullResult {
  final List<Article> articles;
  final int total;

  FullResult(this.articles, this.total);
}