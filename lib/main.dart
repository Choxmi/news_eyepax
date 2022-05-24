import 'package:flutter/material.dart';
import 'package:news_eyepax/screens/dashboard.dart';
import 'package:news_eyepax/screens/login.dart';
import 'package:news_eyepax/screens/news_details.dart';
import 'package:news_eyepax/screens/news_list.dart';
import 'package:news_eyepax/screens/registration.dart';

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
      home: Container(),
    );
  }
}
