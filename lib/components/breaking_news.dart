import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_eyepax/api/news_api.dart';
import 'package:news_eyepax/components/carousel.dart';
import 'package:news_eyepax/components/lazy_container.dart';
import 'package:news_eyepax/components/news_chip.dart';
import 'package:news_eyepax/model/article.dart';
import 'package:news_eyepax/utilities/constants.dart';

import '../screens/news_list.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({Key? key}) : super(key: key);

  @override
  _BreakingNewsState createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  List<Article> articles = [];
  bool isLoading = false;
  String selectedCategory = categories[0];

  void fetchData() {
    setState(() {
      isLoading = true;
    });
    NewsAPI().getHeadlines(country: 'us', category: selectedCategory).then((value) {
      setState(() {
        articles = value;
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 4 + 120,
      child: LazyContainer(
        isLoading: isLoading,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                height: 50.0,
                child: Row(
                  children: [
                    Text(
                      'Breaking News',
                      style: GoogleFonts.tinos().copyWith(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(NewsList.id, arguments: articles);
                      },
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Text(
                            'See All',
                            style: GoogleFonts.nunito()
                                .copyWith(color: Colors.blueAccent),
                          ),
                          const Icon(
                            Icons.chevron_right,
                            color: Colors.blueAccent,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Carousel(
              articleList: articles,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      categories.length,
                          (index) => NewsChip(
                        title: categories[index],
                        selected: categories[index] == selectedCategory,
                        onPressed: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                          fetchData();
                        },
                      )),
                ),
              ),
            ),
          ],
        ),),
    );
  }
}
