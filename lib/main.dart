import 'package:flutter/material.dart';
import 'package:news_eyepax/screens/dashboard.dart';
import 'package:news_eyepax/screens/login.dart';
import 'package:news_eyepax/screens/news_details.dart';
import 'package:news_eyepax/screens/news_list.dart';
import 'package:news_eyepax/screens/registration.dart';
import 'package:news_eyepax/screens/search.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: Dashboard.id,
      routes: {
        Dashboard.id: (BuildContext context) => const Dashboard(),
        Login.id: (BuildContext context) => const Login(),
        NewsDetails.id: (BuildContext context) => const NewsDetails(),
        NewsList.id: (BuildContext context) => const NewsList(),
        Registration.id: (BuildContext context) => const Registration(),
        Search.id: (BuildContext context) => const Search(),
      },
    );
  }
}
