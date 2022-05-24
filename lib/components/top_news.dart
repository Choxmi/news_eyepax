import 'package:flutter/material.dart';
import 'package:news_eyepax/api/news_api.dart';
import 'package:news_eyepax/components/news_mini_card.dart';
import 'package:news_eyepax/model/article.dart';

class TopNews extends StatefulWidget {
  const TopNews({Key? key}) : super(key: key);

  @override
  _TopNewsState createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    NewsAPI().getEverything(q: 'hot').then((value){
      setState(() { articles = value;});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView(
      children: List.generate(articles.length, (index) => NewsMiniCard(article: articles[index])),
    ),);
  }
}
