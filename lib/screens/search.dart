import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_eyepax/api/news_api.dart';
import 'package:news_eyepax/components/news_chip.dart';
import 'package:news_eyepax/components/news_mini_card.dart';
import 'package:news_eyepax/components/search_bar.dart';
import 'package:news_eyepax/model/article.dart';
import 'package:news_eyepax/utilities/constants.dart';

class Search extends StatefulWidget {
  final String? text;
  const Search({Key? key, this.text}) : super(key: key);
  static const String id = 'search';

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();
  String searchText = '';
  List<Article> articles = [];
  int total = 0;
  String selectedLanguage = '';
  ScrollController scroller = ScrollController();
  int page = 1;

  void fetchData() {
    NewsAPI()
        .getEverything(q: controller.text, language: selectedLanguage, page: page)
        .then((value) {
      setState(() {
        articles = value.articles;
        total = value.total;
      });
    });
  }

  void pagination() {
    if (scroller.position.pixels == scroller.position.maxScrollExtent) {
      setState(() {
        page++;
      });
      fetchData();
    } else if(scroller.position.pixels == scroller.position.minScrollExtent) {
      setState(() {
        page--;
      });
      fetchData();
    }
  }

  @override
  void initState() {
    scroller.addListener(pagination);
    super.initState();
    controller.text = widget.text ?? '';
    setState(() {
      searchText = widget.text ?? '';
    });
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                  width: double.infinity,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        child: SearchBar(
                          searchController: controller,
                          dirty: searchText != '',
                          hint: 'Type to search',
                          onSearch: () {
                            if (searchText != '') {
                              setState(() {
                                searchText = '';
                                total = 0;
                              });
                              controller.text = '';
                            }
                          },
                          onChange: (val) {
                            setState(() {
                              searchText = val;
                            });
                            fetchData();
                          },
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      languages.length,
                      (index) => NewsChip(
                            title: languages[index],
                            selected: languages[index] == selectedLanguage,
                            onPressed: (value) {
                              setState(() {
                                selectedLanguage = value;
                              });
                              fetchData();
                            },
                          )),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Text('About $total results for ',
                        style: GoogleFonts.nunito()),
                    Text(
                      controller.text,
                      style: GoogleFonts.nunito()
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: List.generate(articles.length,
                    (index) => NewsMiniCard(article: articles[index]),),
                controller: scroller,
              ),
            )
          ],
        ),
      ),
    );
  }
}
