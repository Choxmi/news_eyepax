import 'package:dart_date/dart_date.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_eyepax/components/list_image.dart';
import 'package:news_eyepax/model/article.dart';
import 'package:news_eyepax/screens/news_details.dart';
import 'package:news_eyepax/utilities/constants.dart';

class NewsMiniCard extends StatelessWidget {
  final Article article;
  const NewsMiniCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, NewsDetails.id, arguments: article);
        },
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              ListImage(imgPath: article.urlToImage ?? defaultNewsImage),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(article.title ?? '', style: GoogleFonts.tinos().copyWith(fontSize: 15.0, color: Colors.white),),
                      SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Text(
                                article.author ?? '',
                                style: GoogleFonts.nunito().copyWith(
                                    color: Colors.white, fontSize: 10.0),
                                overflow: TextOverflow.ellipsis,
                              ),
                              width: MediaQuery.of(context).size.width / 2,
                            ),
                            Text(
                              DateTime.parse(article.publishedAt ??
                                      DateTime.now().toString())
                                  .toHumanString(),
                              style: GoogleFonts.nunito()
                                  .copyWith(color: Colors.white, fontSize: 10.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
