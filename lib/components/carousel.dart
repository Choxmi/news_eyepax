import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:news_eyepax/components/news_card.dart';
import 'package:news_eyepax/model/article.dart';

class Carousel extends StatelessWidget {
  final List<Article> articleList;
  const Carousel({Key? key, required this.articleList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height/4,
        aspectRatio: 3/2,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 2,
        autoPlay: true,
        viewportFraction: 0.85
      ),
      items: articleList.map((article) => NewsCard(article: article,)).toList(),
    );
  }
}
