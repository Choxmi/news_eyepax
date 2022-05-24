import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_eyepax/model/article.dart';
import 'package:news_eyepax/utilities/constants.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key}) : super(key: key);
  static const String id = 'news_details';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.network(
              article.urlToImage ?? defaultNewsImage,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 2,
            ),
            SafeArea(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 35.0,
                  height: 35.0,
                  margin: const EdgeInsets.all(5.0),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: Color(0xFFF5F5F5)),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 20.0,
                      color: Color(0xFF173418),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: MediaQuery.of(context).size.height / 2 + 40,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                      padding: const EdgeInsets.only(
                          top: 80.0, left: 20.0, right: 20.0),
                      child: SingleChildScrollView(
                        child: Text(
                          article.description ?? '',
                          style: GoogleFonts.nunito().copyWith(fontSize: 14.0),
                          textAlign: TextAlign.justify,
                        ),
                      )),
                ),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                    color: Colors.white),
              ),
              top: MediaQuery.of(context).size.height / 2 - 40,
            ),
            Positioned(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 5.0,
                    sigmaY: 5.0,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width * 4 / 5,
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          color: Color(0xADCECECE)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(DateTime.parse(article.publishedAt ?? DateTime.now().toString())
                                .toIso8601String(), style: GoogleFonts.nunito().copyWith(fontSize: 14.0),),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height / 5 - 80,
                              child: SingleChildScrollView(
                                child: Text(
                                  article.description ?? '',
                                  style: GoogleFonts.tinos().copyWith(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Text(
                              'Published by ${article.author ?? ''}',
                              style: GoogleFonts.nunito().copyWith(
                                  fontSize: 12.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              left: MediaQuery.of(context).size.width * 1 / 10,
              top: MediaQuery.of(context).size.height / 2 -
                  MediaQuery.of(context).size.height / 6,
            ),
          ],
        ),
      ),
    );
  }
}
