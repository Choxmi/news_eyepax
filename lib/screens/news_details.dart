import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  const NewsDetails({Key? key}) : super(key: key);
  static const String id = 'news_details';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page :: $id'),
      ),
    );
  }
}
