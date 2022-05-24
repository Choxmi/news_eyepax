import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  const NewsList({Key? key}) : super(key: key);
  static const String id = 'news_list';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Page :: $id'),
      ),
    );
  }
}
