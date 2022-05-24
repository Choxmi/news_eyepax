import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_eyepax/components/list_image.dart';
import 'package:news_eyepax/model/article.dart';

import '../components/breaking_news_item.dart';
import '../utilities/constants.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);
  static const String id = 'news_list';

  @override
  Widget build(BuildContext context) {
    final articles = ModalRoute.of(context)!.settings.arguments as List<Article>;
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: SizedBox(
              height: 25.0,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Center(
                    child: Text('Breaking News', style: GoogleFonts.nunito().copyWith(color: primaryColor, fontSize: 18.0, fontWeight: FontWeight.bold,),),
                  ),
                  Positioned(
                    child: GestureDetector(
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Icon(Icons.arrow_back_ios_outlined),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    left: 0.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: ListView(
            children: List.generate(articles.length, (index) => BreakingNewsItem(article: articles[index])),
          ),),
        ],
      ),
    );
  }
}
