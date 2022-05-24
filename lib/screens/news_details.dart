import 'package:flutter/material.dart';
import 'package:news_eyepax/model/article.dart';
import 'package:news_eyepax/utilities/constants.dart';

class NewsDetails extends StatelessWidget {
  final Article? article;
  const NewsDetails({Key? key, this.article}) : super(key: key);
  static const String id = 'news_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: article != null ? Stack(
        children: [
          Image.network(
            article!.urlToImage ?? defaultNewsImage,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height/2,
          ),
        ],
      ) : Text('Oops'),
    );
  }
}
