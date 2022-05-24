import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_eyepax/api/news_api.dart';
import 'package:news_eyepax/api/user_api.dart';
import 'package:news_eyepax/components/carousel.dart';
import 'package:news_eyepax/components/lazy_container.dart';
import 'package:news_eyepax/components/search_bar.dart';
import 'package:news_eyepax/model/article.dart';
import 'package:news_eyepax/screens/login.dart';
import 'package:news_eyepax/screens/news_list.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  static const String id = 'dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool loading = true;
  TextEditingController searchController = TextEditingController();
  List<Article> articles = [];

  @override
  void initState() {
    UserAPI.isLoggedIn().then((value) {
      if (!value) {
        // Navigate to login
        Navigator.pushNamedAndRemoveUntil(
            context, Login.id, ModalRoute.withName(Login.id));
        return;
      }
      NewsAPI().getHeadlines().then((value){
        setState(() {
          loading = false;
          articles = value;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LazyContainer(
          isLoading: loading,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SearchBar(
                searchController: searchController,
              ),
              SizedBox(
                height: 55.0,
                child: Row(
                  children: [
                    Text(
                      'Breaking News',
                      style: GoogleFonts.tinos().copyWith(fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){Navigator.of(context).pushNamed(NewsList.id,arguments: articles);},
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Text(
                            'See All',
                            style: GoogleFonts.nunito().copyWith(color: Colors.blueAccent),
                          ),
                          const Icon(Icons.chevron_right, color: Colors.blueAccent,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Carousel(
                articleList: articles,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
