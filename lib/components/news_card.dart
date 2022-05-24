import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_eyepax/model/article.dart';
import 'package:news_eyepax/screens/news_details.dart';
import 'package:news_eyepax/utilities/constants.dart';

class NewsCard extends StatelessWidget {
  final Article article;

  const NewsCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, NewsDetails.id, arguments: article);
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        child: Stack(
          children: <Widget>[
            FadeInImage.assetNetwork(
              placeholder: 'assets/loading.gif',
              image: article.urlToImage ?? defaultNewsImage,
              fit: BoxFit.fitWidth,
              height: 1000,),
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
                    vertical: 10.0, horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flex(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      direction: Axis.vertical,
                      children: [
                        Text(
                          'by ${article.author ?? ''}',
                          style: GoogleFonts.nunito().copyWith(
                              fontSize: 12.0, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height/10,
                          child: SingleChildScrollView(
                            child: Text(
                              article.description ?? '',
                              maxLines: 3, overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.tinos().copyWith(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: const EdgeInsets.only(top: 30.0), child: Text(
                      article.description ?? '', maxLines: 2, overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.nunito().copyWith(
                          fontSize: 12.0, color: Colors.white),
                    ),),
                  ],
                ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
