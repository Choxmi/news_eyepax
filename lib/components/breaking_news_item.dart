import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_eyepax/components/list_image.dart';
import 'package:news_eyepax/model/article.dart';
import 'package:news_eyepax/screens/news_details.dart';
import 'package:news_eyepax/utilities/constants.dart';
import 'package:dart_date/dart_date.dart';

class BreakingNewsItem extends StatelessWidget {
  final Article article;
  const BreakingNewsItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.pushNamed(context, NewsDetails.id, arguments: article);},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListImage(imgPath: article.urlToImage ?? defaultNewsImage),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              DateTime.parse(article.publishedAt ?? DateTime.now().toString())
                  .toHumanString(),
              style: GoogleFonts.nunito().copyWith(
                fontSize: 12.0,
                fontWeight: FontWeight.w100,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(article.title ?? '', style: GoogleFonts.tinos().copyWith(fontWeight: FontWeight.bold, fontSize: 18.0),),
            const SizedBox(
              height: 10.0,
            ),
            Text(article.description ?? '', style: GoogleFonts.nunito().copyWith(
              fontSize: 16.0,
              fontWeight: FontWeight.w200,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,),
            Text('Read More',style: GoogleFonts.nunito().copyWith(
              color: Colors.blueAccent,
              fontSize: 16.0,
              fontWeight: FontWeight.w200,
            ),),
            const SizedBox(
              height: 20.0,
            ),
            Text('Published by ${article.author ?? ''}', style: GoogleFonts.nunito().copyWith(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
